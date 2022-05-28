db = require "../../dbutils"
commaNumber = require "comma-number"

module.exports =
    name: "cash"
    cate: "eco"
    alias: ["bal", "balance"]
    desc: "Check your eco cash"
    run: ({ client, message }) ->
        cash = await db.user.searchProp message.author.id, "eco.cash"
        cash = commaNumber cash

        return message.channel.createMessage {
            content: "**#{message.author.username}**, you currently have **__#{cash}__** cash"
        }
        