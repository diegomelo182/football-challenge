import Navbar from 'react-bootstrap/Navbar';
import Container from 'react-bootstrap/Container';
import Button from 'react-bootstrap/Button';
import { useRouter } from 'next/router';
import jwtDecode from 'jwt-decode';

export default function Topbar() {
  const router = useRouter();
  const goToHomePage = () => router.push('/');
  const logout = () => {
    sessionStorage.removeItem('token');
    goToHomePage();
  };
  const userRole = () => {
    try {
      const data = jwtDecode(sessionStorage.getItem('token'));
      return data.role;
    } catch (error) {
      return null;
    }
  };

  return (
    <Navbar bg='light' style={{ marginBottom: 15 }}>
      <Container>
        <Navbar.Brand onClick={goToHomePage}>
          {userRole() && <span>[{userRole().toUpperCase()}]</span>} Football
          Challenge
        </Navbar.Brand>

        <Button onClick={logout}>Logout</Button>
      </Container>
    </Navbar>
  );
}
