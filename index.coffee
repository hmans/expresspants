polka = require "polka"
posts = require "./posts"

posts.createSeedData()

polka()
  .get "/posts/:id", (req, res) ->
    posts.load req.params.id, (err, post) ->
      console.log post
      res.end "Post Title: #{post.title}"

  .listen 3000
  .then ->
    console.log "> sadpants running on http://localhost:3000"
