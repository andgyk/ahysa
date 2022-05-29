module.exports =
    name: "invite"
    cate: "core"
    desc: "Link to invite the bot"
    run: ({ message }) ->
        message.channel.createMessage {
            content: "
            Invite:
             https://discord.com/api/oauth2/authorize?client_id=979750867483906088&permissions=70601792&scope=bot
            "
        }