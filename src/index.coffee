# Setup environment variables locally
# using dotenv package
env = require "dotenv"
do env.config

fs = require "fs"
path = require "path"
mongoose = require "mongoose"

Ahysa = require "./client"
options = {
    intents: ["guilds", "guildMessages"]
}

connect_mongodb = ->
    # Emitted when connection opened
    mongoose.connection.once "open", ->
        console.info "Mongodb connection established"
    # Connect to mongodb
    mongoose.connect process.env.MONGODB_URL

loadCommands = ({ client, dir }) ->
    # If directory does not exist then create it
    # for preventing fs error
    if not fs.existsSync dir
        fs.mkdirSync dir

    files = fs.readdirSync dir
    i = 0

    while i < files.length
        filePath = path.resolve path.join dir, files[i]
        isDir = do fs.statSync(filePath).isDirectory
        
        if isDir
            loadCommands { client, dir: filePath }
        else
            name = path.basename filePath
            
            if name.endsWith ".js"
                file = require filePath
                if typeof file is "object"
                    # Add file path to the prop
                    file.path = filePath
                    # Set file to command cache
                    client.commands.setCommand (name.replace ".js", ""), file
                

        i++

client = new Ahysa process.env.DISCORD_TOKEN, options
loadCommands { client, dir: path.join "dist", "commands" }

# Calls the function to connect to mongodb using mongoose
do connect_mongodb
# Calls the "client.connect()" method
do client.connect
process.on "unhandledRejection", (errorMessage) ->
    console.info "Rejection handled:"
    return console.error errorMessage

process.on "uncaughtException", (errorMessage) ->
    console.info "Uncaughted expection handled:"
    return console.error errorMessage