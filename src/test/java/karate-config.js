function fn() {
  var env = karate.env; // e.g. dev, qa, prod
  if (!env) {
    env = 'dev';
  }

  var config = {
    baseUrl: 'https://fakerapi.it/api/v2/',
    timeout: 5000
  };

  // common headers
  config.headers = { 'Content-Type': 'application/json' };

  karate.configure('connectTimeout', 10000);
  karate.configure('readTimeout', 10000);

  return config;
}
