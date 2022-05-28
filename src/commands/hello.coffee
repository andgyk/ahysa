module.exports =
    name: "hello"
    cate: "core"
    desc: "Hello World"
    run: ({ client, message }) ->
        message.channel.createMessage "Hello #{message.author.username}"