import 'jest';

const ENV = process.env.ENV || 'dev';

const getDockerTag = env => (env === 'prod' ? 'latest' : env);

describe('first', () => {
  it('foo', () => {});
});
