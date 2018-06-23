sqlite3 = require('sqlite3').verbose()
db = new sqlite3.Database(':memory:')

db.serialize ->
  db.run("CREATE TABLE posts (id INTEGER PRIMARY KEY, title TEXT, body TEXT)")

module.exports = db
