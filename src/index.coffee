process.on "unhandledRejection", (errorMessage) ->
    console.info "Rejection handled:"
    return console.error errorMessage

process.on "uncaughtException", (errorMessage) ->
    console.info "Uncaughted expection handled:"
    return console.error errorMessage