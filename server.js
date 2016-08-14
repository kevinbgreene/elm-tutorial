const express = require('express');
const app = express();

function getPosts() {
  return [
    {
      id : 0,
      author : 'John Doe',
      title : 'First Title',
      body : 'First Body'
    },
    {
      id : 1,
      author : 'Jane Doe',
      title : 'Second Title',
      body : 'Second Body'
    }
  ];
}


app.use(express.static('./'));
app.use(express.static('./assets'));

app.get('/api/posts', (req, res) => {
  const posts = getPosts();
  res.json(posts);
});

app.get('/api/*', (req, res) => {
  res.status(404).send('Not Found');
});

app.get('*', (req, res) => {
  res.sendFile(__dirname + '/index.html');
});

const server = app.listen(3000, () => {
  const host = server.address().address;
  const port = server.address().port;
  console.log('Example app listening at http://%s:%s', host, port);
});
