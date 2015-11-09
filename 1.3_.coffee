c = -> console.log.apply console, arguments

c "Design an algorithm and write code to remove the duplicate characters in a string without using any additianal buffer.  NOTE: One or two additional variables are fine. An extra copy of the array is not.  FOLLOW UP: Write the test cases for this method."

make_random_string = require('./make_random_string_.coffee')

is_unique_char = require('./1.1_.coffee')

x = make_random_string 12, false

c 'x', x

c 'x is unique: ', is_unique_char(x)


remove_copies = (str) ->
    # i'm treating this array as only data structure, since i don't actually use the string, just convert to array
    rayy = str.split ''
    for char, idx in rayy
        for char_2, idx_2 in rayy
            if (idx isnt idx_2) and (char is char_2)
                rayy.splice idx_2, 1
    strang = rayy.toString().replace(/,/g, '')
    return strang


y = remove_copies x
c 'y', y
c 'now is unique', is_unique_char(y)

