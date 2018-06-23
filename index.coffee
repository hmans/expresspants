express = require "express"
posts = require "./posts"
timedLogger = require "./timedLogger"

posts.createSeedData()

app = express()
  .set 'view engine', 'pug'
  .use timedLogger

  .get '/', (req, res) ->
    res.render 'index', { title: 'Hey', message: 'Hello there!' }

  .get '/posts/:id', (req, res) ->
    post = await posts.load req.params.id
    res.render 'post', { post }



  .listen 3000, ->
    console.log "> polkapants running on http://localhost:3000"

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
