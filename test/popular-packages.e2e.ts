import 'jest';
import api from './api';
import { mockPopularPackageNames } from './db';

describe('popular-packages', () => {
  beforeAll(async () => {
    await mockPopularPackageNames();
    await api.post('popular-packages');
  });

  it('are exist', async () => {
    let result;
    do {
      result = await api.get('popular-packages');
      console.log(result);
    } while (result.length !== 3);
  });
});
