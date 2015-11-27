c = -> console.log.apply console, arguments


rayy_equals = (rayy_a, rayy_b)->
    if rayy_a.length isnt rayy_b.length
        return false
    else
        for idx in [0 .. (rayy_a.length - 1)]
            if rayy_a[idx] isnt rayy_b[idx]
                return false
        return true


clone_rayy_000 = (rayy)->
    clone = []
    for i, idx in rayy
        clone[idx] = i
    return clone

enumerate_permutations_001 = (rayy)->
    # c "\n"
    if rayy.length is 1
        return [rayy]
    else
        catalogue = []
        for char, idx in rayy
            clone = clone_rayy_000 rayy
            # c "clone #{clone}, rayy #{rayy}"
            clone.splice idx, 1
            # c "clone #{clone}, rayy #{rayy}"
            book = arguments.callee clone
            for rayy_2, idx_2 in book
                catalogue.push [char].concat(rayy_2)
        return catalogue

are_anagrams_000 = (a, b)->
    rayy_a = a.split ''
    rayy_b = b.split ''
    perms_a = enumerate_permutations_001 rayy_a
    perms_b = enumerate_permutations_001 rayy_b

    for perm in perms_b
        if rayy_equals(rayy_a, perm)
            return "YES"
    return "NO"




are_anagrams_001 = (a, b)->
  c are_anagrams_000(a, b)

are_anagrams_001 'god', 'dog'

are_anagrams_001 'abab', 'aaab'