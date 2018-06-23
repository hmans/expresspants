polka = require "polka"
posts = require "./posts"

posts.createSeedData()

logger = (req, res, next) ->
  console.log "#{req.method} #{req.url}"
  next()

polka()
  .use logger
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
