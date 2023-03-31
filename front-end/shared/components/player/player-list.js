import Container from 'react-bootstrap/Container';
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import Table from 'react-bootstrap/Table';
import Button from 'react-bootstrap/Button';
import Pagination from 'react-bootstrap/Pagination';
import { useEffect, useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import jwtDecode from 'jwt-decode';

import PlayerService from '@/shared/services/player-service';
import {
  selectPlayersModalsState,
  selectPlayersPaginationState,
  selectPlayersqueryParamsState,
  selectPlayersState,
  setPlayersItems,
  setPlayersLoading,
  setPlayersModalsParams,
  setPlayersPagination,
  setSelectedPlayer,
} from '@/redux/slices/players';
import PlayerNotificationModal from './player-notification-modal';
import PlayerListFilter from './player-list-filter';
import PlayerSubscriptionModal from './player-subscription-modal';

const playerService = new PlayerService();

export default function PlayerList() {
  const playersQueryParamsState = useSelector(selectPlayersqueryParamsState);
  const playersState = useSelector(selectPlayersState);
  const playersPaginationState = useSelector(selectPlayersPaginationState);
  const playerModalsState = useSelector(selectPlayersModalsState);
  const { currentPage, numberOfPages } = playersPaginationState;

  const [showModal, setShowModal] = useState(false);
  const [paginationArray, setPaginationArray] = useState([1]);

  const dispatch = useDispatch();

  const userRole = () => {
    try {
      const data = jwtDecode(sessionStorage.getItem('token'));
      return data.role;
    } catch (error) {
      return null;
    }
  };

  useEffect(() => {
    if (playersState?.length > 0) return;

    dispatch(setPlayersLoading(true));
    playerService
      .fetchAll()
      .then(({ data }) => {
        dispatch(setPlayersItems(data));
        const { meta } = data;
        dispatch(
          setPlayersPagination({
            currentPage: 1,
            numberOfPages: meta?.number_of_pages,
          })
        );
        dispatch(setPlayersLoading(false));
      })
      .catch(() => dispatch(setPlayersLoading(false)));
  }, []);

  useEffect(() => {
    if (playersState?.length === 0) return () => {};

    dispatch(setPlayersLoading(true));
    playerService
      .fetchAll({ ...playersQueryParamsState, page: 1 })
      .then(({ data }) => {
        dispatch(setPlayersItems(data));
        dispatch(setPlayersLoading(false));

        if (data?.meta?.number_of_pages !== numberOfPages) {
          dispatch(
            setPlayersPagination({
              currentPage: 1,
              numberOfPages: data?.meta?.number_of_pages,
            })
          );
        }
      })
      .catch(() => dispatch(setPlayersLoading(false)));
  }, [playersQueryParamsState]);

  useEffect(() => {
    if (playersState?.length === 0) return () => {};

    dispatch(setPlayersLoading(true));
    playerService
      .fetchAll({ ...playersQueryParamsState, page: currentPage })
      .then(({ data }) => {
        dispatch(setPlayersItems(data));
        dispatch(setPlayersLoading(false));

        if (data?.meta?.number_of_pages !== numberOfPages) {
          dispatch(
            setPlayersPagination({
              currentPage,
              numberOfPages: data?.meta?.number_of_pages,
            })
          );
        }
      })
      .catch(() => dispatch(setPlayersLoading(false)));
  }, [currentPage]);

  useEffect(() => {
    const newArray = Array(numberOfPages)
      .fill(0)
      .map((item, index) => index + 1);
    setPaginationArray(newArray);
  }, [numberOfPages]);

  const onClickCreateNotification = (playerObj) => {
    dispatch(setSelectedPlayer(playerObj));
    dispatch(
      setPlayersModalsParams({ ...playerModalsState, showNotification: true })
    );
  };

  const onClickCreateSubscription = (playerObj) => {
    dispatch(setSelectedPlayer(playerObj));
    dispatch(
      setPlayersModalsParams({ ...playerModalsState, showSubscription: true })
    );
  };

  return (
    <Container>
      <Row>
        <Col md={12}>
          <h1>Player management</h1>
        </Col>
      </Row>
      <Row>
        <Col md={12}>
          <PlayerListFilter />
        </Col>
      </Row>
      <Row>
        <Col md={12}>
          <Table striped bordered hover>
            <thead>
              <tr>
                <th>Name</th>
                <th>Number</th>
                <th>position</th>
                <th>Nationality</th>
                <th>Team</th>
                <th>Age</th>
                <th>#</th>
              </tr>
            </thead>
            <tbody>
              {playersState?.data?.map((player) => (
                <tr key={player.id}>
                  <td>{player.attributes.name}</td>
                  <td>{player.attributes.number}</td>
                  <td>{player.attributes.position}</td>
                  <td>{player.attributes.nationality_country}</td>
                  <td>{player.attributes.team_name}</td>
                  <td>{player.attributes.age}</td>
                  <td>
                    {userRole() === 'admin' && (
                      <Button
                        variant='primary'
                        size='sm'
                        onClick={() => onClickCreateNotification(player)}
                      >
                        Create notification
                      </Button>
                    )}
                    {userRole() === 'user' && (
                      <Button
                        variant='primary'
                        size='sm'
                        onClick={() => onClickCreateSubscription(player)}
                      >
                        Subscribe to this Player
                      </Button>
                    )}
                  </td>
                </tr>
              ))}
            </tbody>
          </Table>
        </Col>
        <Col md={12}>
          <Pagination size='sm'>
            {paginationArray.map((item) => (
              <Pagination.Item
                key={`key-${item}`}
                active={item === +currentPage}
                onClick={() =>
                  dispatch(
                    setPlayersPagination({
                      currentPage: item,
                      numberOfPages,
                    })
                  )
                }
              >
                {item}
              </Pagination.Item>
            ))}
          </Pagination>
        </Col>
        <PlayerNotificationModal />
        <PlayerSubscriptionModal />
      </Row>
    </Container>
  );
}
