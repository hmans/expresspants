posts = require "./posts"
app = require "./app"

posts.createSeedData()

app
  .get '/', (req, res) ->
    res.render 'index', { title: 'Hey', message: 'Hello there!' }

  .get '/posts/:id', (req, res) ->
    post = await posts.load req.params.id
    res.render 'post', { post }

  .listen 3000, ->
    console.log "> polkapants running on http://localhost:3000"
