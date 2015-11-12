


c = -> console.log.apply console, arguments

{get_random_string} = require './get_random_string_000_.coffee'

c "Write a method to compute all permutations of a string."



factorial_000 = (n)->
    factor = n - 1
    result = n
    while factor > 1
        result *= factor
        factor--
    return result



clone_rayy_000 = (rayy)->
    clone = []
    for i, idx in rayy
        clone[idx] = i
    return clone

enumerate_permutations_001 = (rayy)->
    c "\n"
    if rayy.length is 1
        return [rayy]
    else
        catalogue = []
        for char, idx in rayy
            clone = clone_rayy_000 rayy
            c "clone #{clone}, rayy #{rayy}"
            clone.splice idx, 1
            c "clone #{clone}, rayy #{rayy}"
            book = arguments.callee clone
            for rayy_2, idx_2 in book
                catalogue.push [char].concat(rayy_2)
        return catalogue


z = 8

strang = get_random_string z, true

c "strang #{strang}"

rayy = strang.split ''
c "rayy #{rayy}"

x = enumerate_permutations_001 rayy


c x

c x.length

c factorial_000 z






