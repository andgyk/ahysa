parseMS = require "parse-ms"

names = ["Ahysa", "Elon Musk", "Abalaba", "Kratos", "Lady Dimitrescu", "Agent 47"]

module.exports =
    name: "beg"
    cate: "eco"
    desc: "Beg for some cash"
    run: ({ client, message, schema: { user } }) ->
        timeout = do new Date(user.eco.beg.timeout).getTime

        if timeout isnt null & do Date.now < timeout
            return message.channel.createMessage {
                content: "
                :stopwatch: | **#{message.author.username}**, you have to wait
                **#{((timeout - do Date.now) / 1000).toFixed 1} secs** to beg again.
                "
            }


        if (Math.floor do Math.random * 4) is 2
            return message.channel.createMessage {
                content: "**#{message.author.username}**, Better luck next time!"
            }

        name = names[Math.floor do Math.random * names.length]
         
        got = Math.floor do Math.random * 250
        user.eco.cash = user.eco.cash + got
        user.eco.beg = {
            timeout: do Date.now + 1000 * 15
            total: user.eco.beg.total + 1
        }

        await do user.save
        message.channel.createMessage {
            embed:
                title: "Beg Result"
                description: "**#{name}** saw you in the street and gave you **__#{got}__** cash"
                footer:
                    text: message.author.username
                    icon_url: message.author.dynamicAvatarURL "png"
        }
