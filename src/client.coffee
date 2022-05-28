{ Client } = require "eris"

class Ahysa extends Client
    constructor: (token, options) ->
        super token, options

        # For command cache
        @commandCache = new Map

        @getCachedCommand = (name) ->
            command = undefined

            @commandCache.forEach (val) ->
                if not command
                    if val.name is name
                        command = val
                    else if val.alias isnt undefined
                        if (Array.isArray val.alias) & val.alias.includes name
                            command = val
                        else if typeof val.alias is "string" & val.alias is name
                            command = val
            return command

        # Event on
        @on "messageCreate", (message) ->
            command = require("./events/message").commands

            return command { client: @, message }

        # Event once
        @once "ready", ->
            require("./events/ready")(@)

module.exports = Ahysa