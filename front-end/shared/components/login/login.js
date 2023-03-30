import Button from 'react-bootstrap/Button';
import Form from 'react-bootstrap/Form';
import Card from 'react-bootstrap/Card';
import Container from 'react-bootstrap/Container';
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';

export default function Login(params) {
  return (
    <Container className='justify-content-md-center'>
      <Row>
        <Col md={3}>
          <Card>
            <Card.Body>
              <Card.Title>Login</Card.Title>

              <Form>
                <Form.Group className='mb-3' controlId='formBasicEmail'>
                  <Form.Label>Email address</Form.Label>
                  <Form.Control type='email' placeholder='Enter email' />
                </Form.Group>

                <Form.Group className='mb-3' controlId='formBasicPassword'>
                  <Form.Label>Password</Form.Label>
                  <Form.Control type='password' placeholder='Password' />
                </Form.Group>

                <Button variant='primary' type='submit'>
                  Submit
                </Button>
              </Form>
            </Card.Body>
          </Card>
        </Col>
        <Col md={3}>
          <Card>
            <Card.Body>
              <Card.Title>Login information</Card.Title>
              <Card.Text>
                <ul>
                  <li>
                    Admin user information: <b>e-mail: </b> admin@email.com and{' '}
                    <b>password: </b>
                  </li>
                  <li>
                    Normal user information: <b>e-mail: </b> user@email.com and{' '}
                    <b>password: </b>
                  </li>
                </ul>
              </Card.Text>
            </Card.Body>
          </Card>
        </Col>
      </Row>
    </Container>
  );
}
