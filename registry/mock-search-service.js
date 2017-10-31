const mockScores = require('./mock-scores.json');
const express = require('express');
const app = express();

const defaultScores = {
  detail: {
    quality: 0.9917524321925419,
    popularity: 0.9647688748839424,
    maintenance: 0.9597678408419759
  }
};

app.get('/-/v1/search', ({ query }, res) => {
  const pkg = query.text;
  const length = Number(query.size || 5);
  const score = mockScores[pkg] ? { detail: mockScores[pkg] } : defaultScores;
  const objects = Array.from({ length }).map(
    (_, i) =>
      i === 0 ? { package: { name: pkg }, score } : { package: { name: `noise-${i + 1}` }, score: defaultScores }
  );
  res.json({ objects });
});

app.listen(3002);
