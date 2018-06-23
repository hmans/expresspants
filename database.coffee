sqlite3 = require('sqlite3').verbose()
db = new sqlite3.Database(':memory:')

db.serialize ->
  db.run("CREATE TABLE posts (id INTEGER PRIMARY KEY, title TEXT, body TEXT)")

  stmt = db.prepare("INSERT INTO posts VALUES (?, ?, ?)")
  stmt.run 1, "Hello...", "...world!"
  stmt.run 2, "OMG", "It works!"
  stmt.finalize()

module.exports = db
