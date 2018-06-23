polka = require "polka"
posts = require "./posts"

posts.createSeedData()

polka()
  .get "/posts/:id", (req, res) ->
    posts.load req.params.id
      .then (post) ->
        console.log post
        res.end "Post Title: #{post.title}"
      .catch (error) ->
        console.log "OMG ERROR: #{error}"

  .listen 3000
  .then ->
    console.log "> sadpants running on http://localhost:3000"
