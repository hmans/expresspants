polka = require("polka")
db = require("./database")

polka()
  .get "/posts/:id", (req, res) ->
    db.get "SELECT * FROM posts WHERE id = ?", req.params.id, (err, post) ->
      console.log post
      res.end "Post Title: #{post.title}"
  .listen 3000
  .then ->
    console.log "> sadpants running on http://localhost:3000"
