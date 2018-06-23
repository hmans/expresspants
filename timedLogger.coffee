responseTime = require "response-time"

module.exports = responseTime (req, res, time) ->
  timeString = if time < 1
    "#{(time * 1000).toFixed(2)}µs"
  else
    "#{time.toFixed(2)}ms"

  console.log "#{req.method} #{req.url} (took #{timeString})"
