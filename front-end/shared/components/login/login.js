import Button from 'react-bootstrap/Button';
import Form from 'react-bootstrap/Form';
import Card from 'react-bootstrap/Card';
import Container from 'react-bootstrap/Container';
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import { useForm, Controller } from 'react-hook-form';
import { yupResolver } from '@hookform/resolvers/yup';
import { toast } from 'react-toastify';
import jwtDecode from 'jwt-decode';
import { useRouter } from 'next/router';

import validation from './login-validation';
import AuthService from '@/shared/services/auth-service';

const defaultValues = {
  email: '',
  password: '',
};

export default function Login(params) {
  const {
    control,
    handleSubmit,
    formState: { errors },
  } = useForm({ defaultValues, resolver: yupResolver(validation) });
  const router = useRouter();
  const authService = new AuthService();

  const onSubmit = async (auth) => {
    try {
      const response = await authService.signin({ auth });
      if (response?.data?.token) {
        const tokenData = jwtDecode(response?.data?.token);
        sessionStorage.setItem('token', response?.data?.token);
        if (tokenData.role === 'admin') {
          router.push('/admin');
        } else {
          router.push('/user');
        }
        return;
      }
    } catch (error) {
      if (error?.response?.data?.message)
        return toast.error(error?.response?.data?.message);
    }

    toast.error('Unexpected Error');
  };

  return (
    <Container className='justify-content-md-center'>
      <Row>
        <Col md={3}>
          <Card>
            <Card.Body>
              <Card.Title>Login</Card.Title>

              <form onSubmit={handleSubmit(onSubmit)} noValidate>
                <Form.Group className='mb-3' controlId='formBasicEmail'>
                  <Form.Label>Email address</Form.Label>
                  <Controller
                    control={control}
                    render={({ field: { onChange, onBlur, value, name } }) => (
                      <Form.Control
                        onBlur={onBlur}
                        onChange={onChange}
                        value={value}
                        type='email'
                        placeholder='Enter your email here'
                        name={name}
                      />
                    )}
                    name='email'
                  />
                </Form.Group>
                <p>{errors.email?.message}</p>

                <Form.Group className='mb-3' controlId='formBasicPassword'>
                  <Form.Label>Password</Form.Label>
                  <Controller
                    control={control}
                    render={({ field: { onChange, onBlur, value, name } }) => (
                      <Form.Control
                        onBlur={onBlur}
                        onChange={onChange}
                        value={value}
                        type='password'
                        placeholder='Enter your Password here'
                        name={name}
                      />
                    )}
                    name='password'
                  />
                </Form.Group>
                <p>{errors.password?.message}</p>

                <Button variant='primary' type='submit'>
                  Submit
                </Button>
              </form>
            </Card.Body>
          </Card>
        </Col>
        <Col md={3}>
          <Card>
            <Card.Body>
              <Card.Title>Login information</Card.Title>
              <Card.Text>
                Admin user information:
                <br /> <b>e-mail: </b> admin@email.com <br />
                <b>password: </b>
                MyAdmin@password123
              </Card.Text>
              <Card.Text>
                Normal user information:
                <br /> <b>e-mail: </b> user@email.com <br />
                <b>password: </b>
                MyUser@password123
              </Card.Text>
            </Card.Body>
          </Card>
        </Col>
      </Row>
    </Container>
  );
}
