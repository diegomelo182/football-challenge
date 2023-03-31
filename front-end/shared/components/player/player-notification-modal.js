import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';
import Form from 'react-bootstrap/Form';
import { useEffect, useState } from 'react';
import { yupResolver } from '@hookform/resolvers/yup';
import { useDispatch, useSelector } from 'react-redux';
import { Controller, useForm } from 'react-hook-form';
import { toast } from 'react-toastify';

import {
  selectSelectedPlayerState,
  setSelectedPlayer,
} from '@/redux/slices/players';
import validation from './player-notification-modal-validation';
import NotificationService from '@/shared/services/notification-service';

const notificationService = new NotificationService();

const defaultValues = {
  message: '',
};

export default function PlayerNotificationModal({ show: showProp = false }) {
  const [show, setShow] = useState(showProp);

  const {
    control,
    handleSubmit,
    formState: { errors },
  } = useForm({ defaultValues, resolver: yupResolver(validation) });

  const handleClose = () => {
    setShow(false);
  };

  const selectedPlayerState = useSelector(selectSelectedPlayerState);
  const dispatch = useDispatch();

  useEffect(() => {
    if (showProp !== show) setShow(showProp);
  }, [showProp]);

  const onSubmit = async (data) => {
    if (!selectedPlayerState?.id) {
      setShow(false);
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
        setShow(false);

        return toast.success('The Notification was created successfully');
      }

      toast.error('Unexpected Error');
    } catch (error) {
      if (error?.response?.data?.message)
        return toast.error(error?.response?.data?.message);
    }
  };

  return (
    <Modal show={show} onHide={handleClose} backdrop='static' keyboard={false}>
      <Modal.Header closeButton>
        <Modal.Title>Create Player notification</Modal.Title>
      </Modal.Header>

      <form onSubmit={handleSubmit(onSubmit)} noValidate>
        <Modal.Body>
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
