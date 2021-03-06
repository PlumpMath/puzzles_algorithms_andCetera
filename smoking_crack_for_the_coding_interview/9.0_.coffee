c = -> console.log.apply console, arguments

allowed_chars= ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']



get_random_in_range = (range) ->
    # get random integer between 0 and (range - 1)
    return Math.floor((Math.random() - 0.00000000001) * (range))

_ = require 'lodash'

# only recently imported lodash.  in typical interviews won't have access to 
# lodash so thought it was good to exercise without it, but with it can 
# move to more functional style programming, so may refactor some with it
# also might be able to take more advantage without it using some es6 
# features
# on the other hand, lodash implements useful algorithms that we are trying to
# develop practice implementing ourselves, so maybe it's something good to 
# avoid

splice_rayy_into_rayy = (target_rayy, target_idx, projectile_rayy)->
    Array.prototype.splice.apply(target_rayy, [target_idx, 0].concat(projectile_rayy))

#randomly shuffle array and return result ; is generalisation of anagram algo
shuffle_array = (rayy)->
    cap = [0 .. (rayy.length - 1)]
    rayy_2 = []
    while cap.length > 0
        cap_idx = Math.floor(Math.random() * (cap.length - 1))
        idx_2 = cap[cap_idx]
        cursor = rayy.pop()
        rayy_2[idx_2] = cursor
        cap.splice cap_idx, 1
    return rayy_2

test_order = (rayy)->
    for idx in [0 .. (rayy.length - 2)]
        if rayy[idx] > rayy[idx + 1]
            return false
    return true

# returns a random anagram of given string
get_random_anagram = (str)->
    rayy = str.split ''
    len = rayy.length
    cap = [0 .. (len - 1)]
    idx = 0
    anagram = []
    while cap.length > 0
        cap_idx = Math.floor(Math.random() * (cap.length - 1))
        idx_2 = cap[cap_idx] # this can be merged with line 30
        cursor = rayy.pop()
        anagram[idx_2] = cursor
        # c "anagram #{anagram}"
        cap.splice cap_idx, 1
    strang = anagram.toString().replace(/,/g, '')
    # c "strang #{strang}"
    return strang

is_anagram = (str_a, str_b)->
    # this fails where elements repeat but not in same cardinality.
    # aaab is not anagram of aabb 
    if str_a.length isnt str_b.length
        return false
    else
        rayy_a = str_a.split '' ; rayy_b = str_b.split ''
        for char, idx in rayy_a
            if rayy_b.indexOf(char) is -1
                return false
        return true

are_anagrams_000 = (a, b)->
    rayy_a = a.split ''
    rayy_b = b.split ''
    perms_a = enumerate_permutations_001 rayy_a
    perms_b = enumerate_permutations_001 rayy_b

    for perm in perms_b
        if rayy_equals(rayy_a, perm)
            return "YES"
    return "NO"





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

get_random_rayy = (n) ->
    rayy = []
    for i in [0 .. (n - 1)]
        rayy.push Math.floor(Math.random() * 1000)
    return rayy

bubble_sort_004 = (rayy)-> # simple no recursion
    while true
        idx = 0
        while (idx < (rayy.length - 1))
            if rayy[idx] > rayy[idx + 1]
                temp = rayy[idx]
                rayy[idx] = rayy[idx + 1]
                rayy[idx + 1] = temp
                break
            idx++
        if idx is (rayy.length - 1)
            return rayy

reverse_array_000 = (rayy)->
    idx = 0
    len = rayy.length
    while idx < (len / 2)
        temp = rayy[idx]
        rayy[idx] = rayy[(len - 1) - idx]
        rayy[len - idx] = temp
        idx++

reverse_array_001 = (rayy, from = 0, to)->
    delta = to - from
    idx = 0
    while idx < (delta / 2)
        capp = from + idx
        temp = rayy[capp]
        rayy[capp] = rayy[to - idx]
        rayy[to - idx] = temp
        idx++



rotate_array_000 = (rayy, n)->
    len = rayy.length
    reverse_array_001 rayy, 0, (len - 1)
    reverse_array_001(rayy, 0, (n - 1))
    reverse_array_001(rayy, n, (len - 1))


obj = 
    get_random_string_001: get_random_string_001
    splice_rayy_into_rayy: splice_rayy_into_rayy
    _: _
    c: c
    shuffle_array: shuffle_array
    get_random_string: get_random_string
    get_random_rayy: get_random_rayy
    bubble_sort_004: bubble_sort_004
    test_order: test_order
    get_random_anagram: get_random_anagram
    is_anagram: is_anagram
    rotate_array_000: rotate_array_000

module.exports = obj






# rayy = [0 .. 11]
# rotate_array_000 rayy, 1
# c "rayy #{rayy}"
# rotate_array_000 rayy, 1
# c "rayy #{rayy}"
# rotate_array_000 rayy, 1
# c "rayy #{rayy}"

# rotate_array_000 rayy, 10
# c "rayy #{rayy}"




# rayy = [0 .. 11]
# c "rayy #{rayy}"
# reverse_array_001 rayy, 7, 11
# c "rayy #{rayy}"






