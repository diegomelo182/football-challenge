import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';
import Form from 'react-bootstrap/Form';
import { useEffect, useState } from 'react';
import { yupResolver } from '@hookform/resolvers/yup';
import { useDispatch, useSelector } from 'react-redux';
import { Controller, useForm } from 'react-hook-form';
import { toast } from 'react-toastify';

import {
  selectPlayersModalsState,
  selectSelectedPlayerState,
  setPlayersModalsParams,
  setSelectedPlayer,
} from '@/redux/slices/players';
import validation from './player-notification-modal-validation';
import NotificationService from '@/shared/services/notification-service';

const notificationService = new NotificationService();

const defaultValues = {
  message: '',
};

export default function PlayerNotificationModal() {
  const playerModalsState = useSelector(selectPlayersModalsState);
  const { showNotification } = playerModalsState || {};

  const {
    control,
    handleSubmit,
    formState: { errors },
  } = useForm({ defaultValues, resolver: yupResolver(validation) });

  const handleClose = () => {
    dispatch(setSelectedPlayer({}));
    dispatch(
      setPlayersModalsParams({
        ...playerModalsState,
        showNotification: false,
      })
    );
  };

  const selectedPlayerState = useSelector(selectSelectedPlayerState);
  const dispatch = useDispatch();

  const onSubmit = async (data) => {
    if (!selectedPlayerState?.id) {
      dispatch(
        setPlayersModalsParams({
          ...playerModalsState,
          showNotification: false,
        })
      );
      return toast.error('You need to select a Player before it');
    }

    const params = {
      notification: {
        ...data,
        player_id: selectedPlayerState.id,
      },
    };

    try {
      const response = await notificationService.create(params);
      console.log(response);
      if (response?.data) {
        dispatch(setSelectedPlayer({}));
        dispatch(
          setPlayersModalsParams({
            ...playerModalsState,
            showNotification: false,
          })
        );

        return toast.success('The Notification was created successfully');
      }

      toast.error('Unexpected Error');
    } catch (error) {
      if (error?.response?.data?.message)
        return toast.error(error?.response?.data?.message);
    }
  };

  return (
    <Modal
      show={showNotification}
      onHide={handleClose}
      backdrop='static'
      keyboard={false}
    >
      <Modal.Header closeButton>
        <Modal.Title>Create Player notification</Modal.Title>
      </Modal.Header>

      <form onSubmit={handleSubmit(onSubmit)} noValidate>
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
            <hr />
          </div>

          <Form.Group className='mb-3' controlId='formBasicEmail'>
            <Form.Label>Message</Form.Label>
            <Controller
              control={control}
              render={({ field: { onChange, onBlur, value, name } }) => (
                <Form.Control
                  onBlur={onBlur}
                  onChange={onChange}
                  value={value}
                  type='textarea'
                  placeholder='Enter your notification message here'
                  name={name}
                />
              )}
              name='message'
            />
          </Form.Group>
          <p>{errors.message?.message}</p>
        </Modal.Body>

        <Modal.Footer>
          <Button variant='primary' type='submit'>
            Create notification
          </Button>
        </Modal.Footer>
      </form>
    </Modal>
  );
}
