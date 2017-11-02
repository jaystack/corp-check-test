import 'jest';
import api from './api';

describe('first', () => {
  it('foo', async () => {
    console.log(await api.get('popular-packages'));
  });
});
