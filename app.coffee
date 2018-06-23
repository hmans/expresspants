express = require "express"
timedLogger = require "./timedLogger"

app = express()
  .set 'view engine', 'pug'
  .use timedLogger

module.exports = app
