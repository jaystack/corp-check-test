import request from 'request-promise-native';

const API_URL = process.env.API_URL || 'http://localhost:3000';

const invoke = (method: string) => (path: string, { query, body }: { query?: object; body?: object } = {}) => {
  console.log(`${API_URL}/${path}`)
  return request(`${API_URL}/${path}`, { json: true, body, query });
};

export default {
  get: invoke('GET'),
  post: invoke('POST')
};
