c = -> console.log.apply console, arguments

c "Write a method to decide if two strings are anagrams or not. \n \n"

make_random_string = require('./make_random_string_.coffee')

make_anagram_from_string = (str)->
    rayy = str.split ''
    anagram = ""
    for i in [0 .. (str.length - 1)]
        anagram += rayy[(str.length - 1)- i]
    return anagram

x = make_random_string 5, true

c 'x', x

anagram = make_anagram_from_string x

c 'anagram:', anagram

test_is_anagram = (str, candide)->
    str_rayy = str.split ''
    candide_rayy = candide.split ''
    len = str_rayy.length
    if len isnt candide_rayy.length then return false
    for i in [0 .. (len - 1)]
        if candide_rayy[(len - 1) - i] isnt str_rayy[i]
            return false
    return true

z = make_random_string 5, true

c "should be true:", test_is_anagram(x, anagram)

c "should be false:", test_is_anagram(x, z)
