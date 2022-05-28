{ Client } = require "eris"

class Ahysa extends Client
    constructor: (token, options) ->
        super token, options

        # For command cache
        @commandCache = new Map

        # Event on
        @on "messageCreate", (message) ->
            command = require("./events/message").commands

            return command { client: @, message }

        # Event once
        @once "ready", ->
            require("./events/ready")(@)

module.exports = Ahysa