import Button from 'react-bootstrap/Button';
import Form from 'react-bootstrap/Form';
import Container from 'react-bootstrap/Container';
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import { useEffect, useState } from 'react';
import { yupResolver } from '@hookform/resolvers/yup';
import { useDispatch, useSelector } from 'react-redux';
import { Controller, useForm } from 'react-hook-form';
import { toast } from 'react-toastify';

import {
  setPlayersPagination,
  setPlayersQueryParams,
} from '@/redux/slices/players';
import NationalityService from '@/shared/services/nationality-service';

const nationalityService = new NationalityService();

const defaultValues = {
  by_nationality: '',
  by_position: '',
};

export default function PlayerListFilter() {
  const { control, handleSubmit } = useForm({ defaultValues });
  const dispatch = useDispatch();

  const [nationalityItems, setNationalityItems] = useState([]);
  const positions = [
    { id: 'A', name: 'Advanced' },
    { id: 'M', name: 'Middle' },
    { id: 'D', name: 'Defensive' },
    { id: 'G', name: 'Goal Keeper' },
  ];

  useEffect(() => {
    const loadNationalities = async () => {
      try {
        const response = await nationalityService.fetchAll();
        const { data } = response;
        setNationalityItems(data);
      } catch (error) {
        if (error?.response?.data?.message)
          return toast.error(error?.response?.data?.message);

        toast.error('Unexpected Error');
      }
    };
    loadNationalities();
  }, []);

  const onSubmit = (data) => {
    const params = { ...data };
    if (params['by_nationality'] === '') delete params['by_nationality'];
    if (params['by_position'] === '') delete params['by_position'];

    dispatch(setPlayersPagination({ currentPage: 1, numberOfPages: 1 }));
    dispatch(setPlayersQueryParams(params));
  };

  return (
    <form onSubmit={handleSubmit(onSubmit)} noValidate>
      <Row>
        <Col>
          <h2>Filters</h2>
        </Col>
      </Row>
      <Row className='align-items-center'>
        <Col md={3}>
          <Form.Group className='mb-3' controlId='formBasicEmail'>
            <Form.Label>Nationality</Form.Label>
            <Controller
              control={control}
              render={({ field: { onChange, onBlur, value, name } }) => (
                <Form.Select
                  onChange={onChange}
                  value={value}
                  name={name}
                  aria-label='Default select example'
                >
                  <option value={''}>Select on option</option>
                  {nationalityItems?.data?.map((item) => (
                    <option key={item.id} value={item.id}>
                      {item.attributes.name}
                    </option>
                  ))}
                </Form.Select>
              )}
              name='by_nationality'
            />
          </Form.Group>
        </Col>

        <Col md={3}>
          <Form.Group className='mb-3' controlId='formBasicEmail'>
            <Form.Label>Position</Form.Label>
            <Controller
              control={control}
              render={({ field: { onChange, onBlur, value, name } }) => (
                <Form.Select
                  onChange={onChange}
                  value={value}
                  name={name}
                  aria-label='Default select example'
                >
                  <option value={''}>Select on option</option>
                  {positions?.map((item) => (
                    <option key={item.id} value={item.id}>
                      {item.name}
                    </option>
                  ))}
                </Form.Select>
              )}
              name='by_position'
            />
          </Form.Group>
        </Col>

        <Col>
          <Button variant='primary' type='submit'>
            Submit
          </Button>
        </Col>
      </Row>
    </form>
  );
}
