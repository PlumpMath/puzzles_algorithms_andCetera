c = -> console.log.apply console, arguments

c 'cracking the coding interview questions chapter 1'

c "Implement an algoritm to determine if a string has all unique characters. What if you can not use additional data structures?\n \n"

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

x = make_random_string 10, false

c 'x', x

is_unique_char = (str) ->
    already_seen = []
    rayy = str.split ''
    for char, idx in rayy
        if already_seen.indexOf(char) is -1
            already_seen.push char
        else
            return false
    return true

c is_unique_char x

y = make_random_string 10, true

c is_unique_char y

is_unique_char_2 = (str) ->
    rayy = str.split ''
    for char, idx in rayy
        for char_2, idx_2 in rayy
            if (idx isnt idx_2) and (char is char_2)
                return false
    return true

c is_unique_char_2 x
c is_unique_char_2 y


module.exports = is_unique_char_2


