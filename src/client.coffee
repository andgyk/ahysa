{ Client } = require "eris"
Command = require "./util/command"
UserSchema = require "./schemas/user-schema"

class Ahysa extends Client
    constructor: (token, options) ->
        super token, options

        # The main commands class
        @commands = new Command

        # Event on
        @on "messageCreate", (message) ->
            command = require("./events/message").commands

            return command { client: @, message }

        # Event once
        @once "ready", ->
            require("./events/ready")(@)

    getSchemaUser: (id) ->
        return new Promise (resolve) =>
            data = await UserSchema.findOne { _id: id }

            if not data
                await do new UserSchema({ _id: id }).save
                return resolve await @getSchemaUser id
            else resolve data

module.exports = Ahysa