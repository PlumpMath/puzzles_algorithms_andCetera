
c = -> console.log.apply console, arguments
get_random_rayy = require('./make_random_array_.coffee')


quick_sort = (rayy) ->
    len = rayy.length
    if len is 1 or len is 0
        return rayy
    random_idx = Math.floor(Math.random() * len)
    apple = rayy.splice random_idx, 1
    pivot = apple[0]
    less = []
    more = []
    for i, idx in rayy
        if i < pivot
            less.push i
            p "less #{less}"
        if i >= pivot
            more.push i
            p "more #{more}"
    less_sorted = arguments.callee less or []
    more_sorted = arguments.callee more or []
    # if less_sorted is undefined then less_sorted = []
    # if more_sorted is undefined then more_sorted = []
    return less_sorted.concat(apple.concat(more_sorted))


rayy = get_random_rayy 11

c 'rayy', rayy.toString()

c quick_sort rayy






