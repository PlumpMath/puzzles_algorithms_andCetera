c = -> console.log.apply console, arguments

allowed_chars= ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']

get_random_in_range = (range) ->
    # get random integer between 0 and (range - 1)
    return Math.floor((Math.random() - 0.00000000001) * (range))

make_random_string = (n, unique)->
    # n is the length of the string to make
    # unique is a boolean which tells us if we need it to have all unique characters

    if (unique is true) and (n > allowed_chars.length)
        return new Error("not enough characters to make a unique string of that length")

    strang = ""
    if unique is false
        for i in [1 .. n]
            rand = Math.floor((Math.random() - 0.00000000001) * (allowed_chars.length))
            strang += allowed_chars[rand]
        return strang

    else
        already = []
        for i in [1 .. n]
            idx = get_random_in_range(n)
            while (already.indexOf(idx) isnt -1)
                idx = get_random_in_range(n)
            already.push idx
            strang += allowed_chars[idx]
        return strang

module.exports = make_random_string