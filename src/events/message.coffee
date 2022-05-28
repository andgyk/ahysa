exports.commands = ({ client, message }) ->
    # If the user is a bot return
    if message.author.bot
        return

    # If the message channel type 1 aka direct messages return
    if message.channel.type is 1
        return

    # Create message on bot mention
    if message.content is "<@979750867483906088>"
        return message.channel.createMessage {
            content: "Hey #{message.author.username} you just mentioned me"
        }

    
    prefix = "ah"
    # Allow messages started with the prefix only
    if not message.content.startsWith prefix
        return

    args = message.content.slice(prefix.length).trim().split(/ +/g)
    content = do args.shift
    command = client.commands.getCommand do content.toLowerCase, true

    if command
        schemaUser = null

        if command.cate is "eco"
            schemaUser = await client.getSchemaUser message.author.id
        
        command.run {
            args, client, message, prefix,
            schema:
                user: schemaUser
        }