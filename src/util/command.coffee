class Command
    constructor: () ->
        @cache = new Map
        @timeout = new Map

    getCommand: (name, allowAlias) ->
        command = undefined

        @cache.forEach (val) ->
            if not command
                if val.name is name
                    command = val
                else if allowAlias & val.alias isnt undefined
                    if (Array.isArray val.alias) & val.alias.includes name
                        command = val
                    else if typeof val.alias is "string" & val.alias is name
                        command = val
        return command

    setCommand: (name, obj) ->
        @timeout.set name, new Map
        @cache.set name, obj

    # Doesnt work
    reloadCommand: (name) ->
        command = @cache.get name
        
        if not command
            return
        else if command.path
            delete require.cache[require.resolve command.path]
            command = require command.path


module.exports = Command