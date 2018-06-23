db = require './database'

module.exports =
  createSeedData: ->
    db.serialize ->
      stmt = db.prepare("INSERT INTO posts VALUES (?, ?, ?)")
      stmt.run 1, "Hello...", "...world!"
      stmt.run 2, "OMG", "It works!"
      stmt.finalize()

  load: (id, fn) ->
    p = new Promise (resolve, reject) ->
      db.get "SELECT * FROM posts WHERE id = ?", id, (error, post) ->
        error ? reject error : resolve post

    p.catch (error) ->
      console.log "Error loading post: #{error}"
