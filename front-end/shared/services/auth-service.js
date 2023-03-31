import axios from 'axios';

import MainService from './main-service';

export default class AuthService extends MainService {
  path = '/v1/auth';

  async signin(data = {}) {
    return await axios.post(`${this.buildUrl()}/signin`, data);
  }
}
