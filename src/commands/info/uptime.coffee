parseMS = require "parse-ms"

module.exports =
    name: "uptime"
    cate: "info"
    alias: ["sysup"]
    desc: "Total uptime of the bot"
    run: ({ client, message }) ->
        uptime = parseMS client.uptime
        return message.channel.createMessage {
            content: "Uptime: #{uptime.days}d, #{uptime.hours}h, #{uptime.minutes}m, #{uptime.seconds}s"
        }