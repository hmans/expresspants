polka = require("polka")

sqlite3 = require('sqlite3').verbose()
db = new sqlite3.Database(':memory:')

db.serialize ->
  db.run("CREATE TABLE posts (id INTEGER PRIMARY KEY, title TEXT, body TEXT)")

  stmt = db.prepare("INSERT INTO posts VALUES (?, ?, ?)")
  stmt.run 1, "Hello...", "...world!"
  stmt.run 2, "OMG", "It works!"
  stmt.finalize()


polka()
  .get "/posts/:id", (req, res) ->
    db.get "SELECT * FROM posts WHERE id = ?", req.params.id, (err, post) ->
      console.log post
      res.end "Post Title: #{post.title}"
  .listen 3000
  .then ->
    console.log "> sadpants running on http://localhost:3000"
