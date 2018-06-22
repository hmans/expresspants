polka = require("polka")

one = (req, res, next) ->
  req.hello = "world"
  next()

two = (req, res, next) ->
  req.foo = "...needs better demo 😔"
  next()

polka()
  .use one, two
  .get "/foo", (req, res) ->
    res.end "Bar!"
  .get "/users/:id", (req, res) ->
    console.log "~> Hello, #{req.hello}"
    res.end "User: #{req.params.id}"
  .listen 3000
  .then ->
    console.log "> Running on localhost:3000"
