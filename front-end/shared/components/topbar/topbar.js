import Navbar from 'react-bootstrap/Navbar';
import Container from 'react-bootstrap/Container';

export default function Topbar() {
  return (
    <Navbar bg='light'>
      <Container>
        <Navbar.Brand href='#home'>Football Challenge</Navbar.Brand>
      </Container>
    </Navbar>
  );
}
