import 'jest';
import api from './api';

describe('first', () => {
  beforeAll(async () => {
    await api.post('popular-packages');
  });

  it('foo', async () => {});
});
