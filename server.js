const express = require('express');
const app = express();


var counter = 0;
const dataStore = {};


app.use(express.static('./'));
app.use(express.static('./assets'));

app.get('/api/*', (req, res) => {
  console.log('req: ' + counter);
  res.json({
    count : (counter++)
  });
});

app.get('*', (req, res) => {
  res.sendFile(__dirname + '/index.html');
});

const server = app.listen(3000, () => {
  const host = server.address().address;
  const port = server.address().port;
  console.log('Example app listening at http://%s:%s', host, port);
});
