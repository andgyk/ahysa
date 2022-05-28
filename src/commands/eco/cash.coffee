db = require "../../dbutils"
commaNumber = require "comma-number"

module.exports =
    name: "cash"
    cate: "eco"
    alias: ["bal", "balance"]
    desc: "Check your eco cash"
    run: ({ client, message, schema: { user } }) ->
        cash = commaNumber user.eco.cash

        return message.channel.createMessage {
            content: "**#{message.author.username}**, you currently have **__#{cash}__** cash"
        }
        