
{c, get_random_string_001, splice_rayy_into_rayy, shuffle_array, get_random_string, get_random_anagram, is_anagram , get_random_rayy, bubble_sort_004, test_order} = require './9.0_.coffee'

c "Write a method to sort an array of strings so that all the anagrams are next
to each other. \n"



# sort array to make anagrams consecutive records
sort_for_anas = (rayy)->
    idx = 0
    output = []
    while idx < rayy.length
        if rayy[idx] is null
            idx++
            continue
        cursor = rayy[idx]
        output.push cursor
        p1 = idx + 2
        anas = []
        while p1 < rayy.length
            if rayy[p1] is null
                p1++
                continue
            if is_anagram(cursor, rayy[p1])
                anas.push rayy[p1]
                rayy[p1] = null
            p1++
        Array.prototype.push.apply output, anas
        idx++
    return output

fizz_bang_anas = (rayy)->
    for word, idx in rayy
        c "word #{word}"
        if idx < 1 then continue
        last = rayy[idx - 1]
        if is_anagram(word, last) then c "BANG BANG"


rayy_macro = []

for i in [0 .. 23]
    strang = get_random_string_001 4, true
    rayy_macro.push strang

c "rayy_macro #{rayy_macro}"

rayy_anagrams = []
for idx in [0 .. 23] by 3
    str = rayy_macro[idx]
    anagram = get_random_anagram str
    rayy_anagrams.push anagram

rayy_macro = rayy_macro.concat rayy_anagrams

c "now rayy_macro #{rayy_macro} \n"

c "now rayy_macro.length #{rayy_macro.length} \n"

shuffled_rayy_macro = shuffle_array(rayy_macro)

c "shuffled_rayy_macro #{shuffled_rayy_macro} \n"


sorted_rayy_macro = sort_for_anas(shuffled_rayy_macro)

fizz_bang_anas sorted_rayy_macro




