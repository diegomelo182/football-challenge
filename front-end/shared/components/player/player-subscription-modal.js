import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';
import { useDispatch, useSelector } from 'react-redux';
import jwtDecode from 'jwt-decode';
import { toast } from 'react-toastify';

import {
  selectPlayersModalsState,
  selectSelectedPlayerState,
  setPlayersModalsParams,
  setSelectedPlayer,
} from '@/redux/slices/players';
import SubscriptionService from '@/shared/services/subscription-service';

const subscriptionService = new SubscriptionService();

export default function PlayerSubscriptionModal() {
  const selectedPlayerState = useSelector(selectSelectedPlayerState);
  const playerModalsState = useSelector(selectPlayersModalsState);
  const { showSubscription } = playerModalsState || {};

  const dispatch = useDispatch();

  const handleClose = () => {
    dispatch(setSelectedPlayer({}));
    dispatch(
      setPlayersModalsParams({ ...playerModalsState, showSubscription: false })
    );
  };

  const onConfirm = async (data) => {
    try {
      const tokenData = jwtDecode(sessionStorage.getItem('token'));
      const params = {
        subscription: {
          player_id: selectedPlayerState.id,
          user_id: tokenData.user_id,
        },
      };
      const response = await subscriptionService.create(params);
      console.log(response);
      if (response?.data) {
        dispatch(setSelectedPlayer({}));
        dispatch(
          setPlayersModalsParams({
            ...playerModalsState,
            showSubscription: false,
          })
        );

        return toast.success('The Subscription was created successfully');
      }
    } catch (error) {
      if (error?.response?.data?.message)
        return toast.error(error?.response?.data?.message);
    }

    toast.error('Unexpected Error!');
  };

  return (
    <Modal
      show={showSubscription}
      onHide={handleClose}
      backdrop='static'
      keyboard={false}
    >
      <Modal.Header closeButton>
        <Modal.Title>Would you like to subscribe this Player?</Modal.Title>
      </Modal.Header>

      <Modal.Body>
        <div>
          <strong>Player Information</strong>
          <br />
          <b>name: </b>
          {selectedPlayerState?.attributes?.name}
          <br />
          <b>position: </b>
          {selectedPlayerState?.attributes?.position}
          <br />
          <b>age: </b>
          {selectedPlayerState?.attributes?.age}
          <br />
          <b>nationality: </b>
          {selectedPlayerState?.attributes?.nationality_country}
          <br />
          <b>team: </b>
          {selectedPlayerState?.attributes?.team_name}
          <br />
        </div>
      </Modal.Body>

      <Modal.Footer>
        <Button variant='primary' onClick={onConfirm}>
          Confirm
        </Button>
        <Button variant='light' onClick={handleClose}>
          Cancel
        </Button>
      </Modal.Footer>
    </Modal>
  );
}
