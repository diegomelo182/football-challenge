import { useState, useEffect } from 'react';
import { useRouter } from 'next/router';
import jwtDecode from 'jwt-decode';

export { RouteGuard };

function RouteGuard({ children }) {
  const router = useRouter();
  const [authorized, setAuthorized] = useState(false);
  const adminPaths = ['/', '/admin'];
  const userPaths = ['/', '/user'];
  const publicPaths = ['/'];

  useEffect(() => {
    // on initial load - run auth check
    authCheck(router.asPath);

    // on route change start - hide page content by setting authorized to false
    const hideContent = () => setAuthorized(false);
    router.events.on('routeChangeStart', hideContent);

    // on route change complete - run auth check
    router.events.on('routeChangeComplete', authCheck);

    // unsubscribe from events in useEffect return function
    return () => {
      router.events.off('routeChangeStart', hideContent);
      router.events.off('routeChangeComplete', authCheck);
    };
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  function authCheck(url) {
    let userData;
    try {
      userData = jwtDecode(sessionStorage.getItem('token'));
    } catch (error) {
      userData = {};
    }
    const path = url.split('?')[0];

    if (!userData?.role && publicPaths.some((pp) => pp === path))
      return setAuthorized(true);

    if (
      (userData?.role === 'admin' &&
        !adminPaths.some((adminPath) => path === adminPath)) ||
      (userData?.role === 'user' &&
        !userPaths.some((userPath) => path === userPath))
    ) {
      setAuthorized(false);

      router.push({
        pathname: '/',
        // query: { returnUrl: router.asPath },
      });
    } else {
      setAuthorized(true);
    }
  }

  return authorized && children;
}
