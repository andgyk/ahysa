{ Client } = require "eris"
Command = require "./command"

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

module.exports = Ahysa