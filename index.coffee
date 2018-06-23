express = require "express"
posts = require "./posts"

posts.createSeedData()

logger = (req, res, next) ->
  console.log "#{Date.now()} #{req.method} #{req.url}"
  next()

app = express()
  .use logger
  .get '/', (req, res) ->
    res.send 'w00p'

console.log "> polkapants running on http://localhost:3000"
app.listen 3000

# polka()
#   .use logger
#   .get "/posts/:id", (req, res) ->
#     post = await posts.load req.params.id
#     console.log post
#
#     if post
#       res.end "Post Title: #{post.title}"
#     else
#       res.end "Not found :-("
#
#   .listen 3000
#   .then ->
#     console.log "> polkapants running on http://localhost:3000"
