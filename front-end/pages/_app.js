import { ToastContainer } from 'react-toastify';

import '@/styles/globals.css';
import 'bootstrap/dist/css/bootstrap.css';
import 'react-toastify/dist/ReactToastify.css';
import { RouteGuard } from '@/shared/components/auth-guard/auth-guard';
import { wrapper } from '@/redux/store';

function App({ Component, pageProps }) {
  return (
    <RouteGuard>
      <Component {...pageProps} />
      <ToastContainer />
    </RouteGuard>
  );
}

export default wrapper.withRedux(App);
