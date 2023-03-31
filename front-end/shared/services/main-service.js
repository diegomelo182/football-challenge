import axios from 'axios';

export default class MainService {
  path = '/';

  async fetchAll(params = {}) {
    return await axios.get(this.buildUrl(), {
      params,
      headers: this.buildHeader(),
    });
  }

  async fetchOne(id) {
    return await axios.get(`${this.buildUrl()}/${id}`, {
      headers: this.buildHeader(),
    });
  }

  async create(data = {}) {
    return await axios.post(this.buildUrl(), data, {
      headers: this.buildHeader(),
    });
  }

  async update(id, data = {}) {
    return await axios.put(`${this.buildUrl()}/${id}`, data, {
      headers: this.buildHeader(),
    });
  }

  async delete(id) {
    return await axios.delete(`${this.buildUrl()}/${id}`, {
      headers: this.buildHeader(),
    });
  }

  buildUrl() {
    const host = process.env.API_HOST || 'http://localhost:3000';
    return `${host}${this.path}`;
  }

  buildHeader() {
    let headers = {
      'Content-Type': 'application/json',
    };
    const token = sessionStorage.getItem('token');
    if (token) headers['Authorization'] = `Bearer ${token}`;

    return headers;
  }
}
