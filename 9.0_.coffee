c = -> console.log.apply console, arguments

test_order = (rayy)->
    for idx in [0 .. (rayy.length - 2)]
        if rayy[idx] > rayy[idx + 1]
            return false
    return true

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

obj = 
    c: c
    get_random_rayy: get_random_rayy
    bubble_sort_004: bubble_sort_004
    test_order: test_order


module.exports = obj