import request from 'request-promise-native';

const API_URL = process.env.API_URL || 'http://localhost:3000';

const invoke = (method: string) => (path: string, { query, body }: { query?: object; body?: object } = {}) => {
  return request(`${API_URL}/${path}`, { json: true, method, body, query });
};

export default {
  get: invoke('GET'),
  post: invoke('POST')
};
