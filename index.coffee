polka = require "polka"
posts = require "./posts"

posts.createSeedData()

polka()
  .get "/posts/:id", (req, res) ->
    post = await posts.load req.params.id
    console.log post

    if post
      res.end "Post Title: #{post.title}"
    else
      res.end "Not found :-("

  .listen 3000
  .then ->
    console.log "> polkapants running on http://localhost:3000"
