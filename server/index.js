/* jshint esversion: 6 */

const path = require('path');
const store = require('./store');
const express = require('express');
const app = express();

app.use(express.static('./assets'));

app.get('/api/posts', (req, res) => {
  const posts = store.getPosts();
  if (posts !== null) {
    res.json(posts);
  } else {
    res.status(404).send('Not Found');
  }
});

app.get('/api/post/:id', (req, res) => {
  const id = parseInt(req.params.id);
  const post = store.getPost(id);
  if (post !== null) {
    res.json(post);
  } else {
    res.status(404).send('Not Found');
  }
});

app.get('/api/*', (req, res) => {
  res.status(404).send('Not Found');
});

app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname, '../assets/index.html'));
});

const server = app.listen(3000, () => {
  const host = server.address().address;
  const port = server.address().port;
  console.log('Example app listening at http://%s:%s', host, port);
});
