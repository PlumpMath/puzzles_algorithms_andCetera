

c = -> console.log.apply console, arguments

c_ = -> process.stdout.write.apply process, arguments

c3 = (a)-> process.stdout.write a

allowed_chars= ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']

get_random_in_range_000 = (range) ->
    # get random integer between 0 and (range - 1)
    return Math.floor((Math.random() - 0.00000000001) * (range))

# get an int between 0 upto-including upper_bound
get_random_int_in_range_001 = (upper_bound)->
    rand = Math.random() - 0.000000001
    return Math.floor(rand * (upper_bound + 1))

get_random_int_in_range_002 = (upper_bound)->
    return Math.floor(Math.random() * (upper_bound + 1))


test_range_func = (func, upper_bound)->
    arq = []
    for i in [0 .. upper_bound]
        arq[i] = false
    nailed = false
    while nailed is false
        int = func upper_bound
        c3 "int: #{int}, "
        if int > upper_bound
            c "BEEEG ERROR"
            break
        if int < 0
            c "LEEETLE ERROR"
            break
        arq[int] = true
        if arq.indexOf(false) is -1
            nailed = true
            c "got it"

# test_range_func get_random_int_in_range_002, 50


# if kilu_set is true, then each character in string can only appear once
get_random_string_002 = (n, kilu_set)->
    if (kilu_set is true) and (n > allowed_chars.length)
        throw new Error("Note enough allowed chars to construct set of size n.")
    strang = ""
    if kilu_set is false
        for i in [1 .. n]
            rand = get_random_int_in_range_002 n
            strang += allowed_chars[rand]
        return strang
    else
        reduced_set = allowed_chars
        for i in [0 .. (n - 1)]
            rand = get_random_int_in_range_002 (reduced_set.length - 1)
            strang += reduced_set[rand]
            reduced_set.splice rand, 1
        return strang


x = get_random_string_002 10, true


# rayy = x.split ''
# for char, idx in rayy











get_random_string_001 = (n, unique)->
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
        for i in [0 .. (n - 1)]
            idx = get_random_in_range(allowed_chars.length)
            while (already.indexOf(idx) isnt -1)
                idx = get_random_in_range(allowed_chars.length)
            already.push idx
            strang += allowed_chars[idx]
        return strang

# this one is problematic, in the random selection
get_random_string = (n, unique)->
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









obj = 
    get_random_string: get_random_string_002


module.exports = obj