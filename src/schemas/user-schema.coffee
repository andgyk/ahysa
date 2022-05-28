{ Schema, model } = require "mongoose"

user = new Schema {
    _id: String
    eco:
        cash:
            type: Number
            default: 0
        bank:
            depo:
                type: Number
                default: 0
            limit:
                type: Number
                default: 2500
        job:
            type: String
            default: "unemp"
        rob:
            total:
                type: Number
                default: 0
            last:
                user:
                    type: String
                    default: null
                time:
                    type: Date
                    default: null
            timeout:
                type: Date
                default: null
        shop: Array
        
    ban:
        has:
            type: Boolean
            default: false
        perma:
            type: Boolean
            default: false
        timeout:
            type: Date
            default: null
},
versionKey: false
timestamps: true

module.exports = model "users", user