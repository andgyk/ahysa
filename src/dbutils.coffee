userSchema = require "./schemas/user-schema"

class User
    @searchProp: (id, keys) ->
        return new Promise (resolve, reject) ->
            data = await userSchema.findOne { _id: id }

            if not data
                data = await do new userSchema(_id: id).save
                return resolve(await User.searchEco id, key)
            else
                val = undefined
                props = keys.split "."
        
                for i of props
                    if not val
                        val = data[props[i]]
                    else val = val[props[i]]
                return resolve val


exports.user = User