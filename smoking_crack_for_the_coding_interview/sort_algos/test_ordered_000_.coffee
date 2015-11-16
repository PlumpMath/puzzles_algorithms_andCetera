

c = -> console.log.apply console, arguments


module.exports = test_order = (rayy)->
    for idx in [0 .. (rayy.length - 2)]
        if rayy[idx] > rayy[idx + 1]
            return false
    return true