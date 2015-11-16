c = -> console.log.apply console, arguments

get_random_rayy = require('./make_random_array_.coffee')
test_order = require('./test_ordered_000_.coffee')
rayy = get_random_rayy 11

c 'rayy', rayy.toString()

bubble_sort_002 = (rayy)-> # with recursion
    idx = 0
    touched = false
    while (idx < (rayy.length - 1))
        if rayy[idx] > rayy[idx + 1]
            temp = rayy[idx]
            rayy[idx] = rayy[idx + 1]
            rayy[idx + 1] = temp
            touched = true
            break
        idx++
    if touched is false
        return rayy
    else
        return arguments.callee(rayy)

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




failed = 0
for x in [5 .. 15]
    rayy = get_random_rayy(x)
    result = bubble_sort_004(rayy)
    c result.toString()
    if test_order(result) is false
        failed++
if failed is 0
    c "bubble_sort passed testing."
else
    c "bubble_sort failed testing with #{failed} failures."







rayy_2 = get_random_rayy 13

c bubble_sort_004(rayy_2)



