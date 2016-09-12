/* jshint esversion: 6 */

const data = [
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

module.exports = {
  getPosts : function() {
    return data;
  },

  getPost : function(id) {
    const len = data.length;
    var post = null;
    for (var i = 0; i < len; i++) {
      post = data[i];
      if (post.id === id) {
        return post;
      }
    }
    return null;
  }
};
