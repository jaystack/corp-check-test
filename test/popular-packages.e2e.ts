import 'jest';
import api from './api';
import { mockPopularPackageNames } from './db';

describe('popular-packages', () => {
  beforeAll(async () => {
    await mockPopularPackageNames();
    await api.post('popular-packages');
  });

  it('are exist', async () => {
    let result = [];
    while (result.length < 3) result = await api.get('popular-packages');
    
    expect(result).toHaveLength(3);

    expect(result[0]).toHaveProperty('cid');
    expect(result[0]).toHaveProperty('name', 'popular-a');
    expect(result[0]).toHaveProperty('version', '1.0.0');
    expect(result[0]).toHaveProperty('state.type', 'SUCCEEDED');
    expect(result[0]).toHaveProperty('state.date');
    expect(result[0]).toHaveProperty('qualification', 'RECOMMENDED');
    expect(result[0]).toHaveProperty('score', 0.9);

    expect(result[1]).toHaveProperty('cid');
    expect(result[1]).toHaveProperty('name', 'popular-b');
    expect(result[1]).toHaveProperty('version', '1.0.0');
    expect(result[1]).toHaveProperty('state.type', 'SUCCEEDED');
    expect(result[1]).toHaveProperty('state.date');
    expect(result[1]).toHaveProperty('qualification', 'ACCEPTED');
    expect(result[1]).toHaveProperty('score', 0.4);

    expect(result[2]).toHaveProperty('cid');
    expect(result[2]).toHaveProperty('name', 'popular-c');
    expect(result[2]).toHaveProperty('version', '1.0.0');
    expect(result[2]).toHaveProperty('state.type', 'SUCCEEDED');
    expect(result[2]).toHaveProperty('state.date');
    expect(result[2]).toHaveProperty('qualification', 'REJECTED');
    expect(result[2]).toHaveProperty('score', 0);
  });
});
