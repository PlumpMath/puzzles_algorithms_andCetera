c = -> console.log.apply console, arguments

# lets say we have an array of ordered pairs, but with duplicates
# we want to get rid of the duplicates

_ = require 'lodash'

random_index_in = (top_index)->
    return Math.floor(Math.random() * (top_index + 1))

clone_rayy = (rayy)->
    clone = []
    for i, idx in rayy
        clone[idx] = i
    return clone

get_rayy_of_ordered_pairs = (top_index, size)->
    arrows = for i in [0 .. (size - 1)]
        index_a = random_index_in top_index
        copy_minus = [0 .. (size - 1)]
        copy_minus.splice index_a, 1
        index_b = copy_minus[random_index_in (top_index - 1)]
        [index_a, index_b]

    return arrows

sparrows = get_rayy_of_ordered_pairs 4, 8

c "sparrows", sparrows, "sparrows.length", sparrows.length

# so one approach would be to modify our map function to reject 
# the random selection of the arrow until it wasn't something that 
# was in our graph
# so we'll try that in a sec, but first we want to test implmenting
# a function which checks for duplicates and deletes them.

#from SO: "An index-based for loop might perform much better than an iterator, since you can index the original array directly and avoid copying to a new array. You'd have much better memory locality, less chance of false sharing, etc."


# uni = clone_rayy arrows

# c "uni", uni, "uni.length", uni.length

# cull = []
# for idx in [0 .. (arrows.length - 2)]
#     for jdx in [(idx + 1) .. (arrows.length - 1)]
#         # c "idx", idx, "jdx", jdx
#         if (arrows[idx][0] is arrows[jdx][0]) and (arrows[idx][1] is arrows[jdx][1])
#             cull.push jdx

# c "cull", cull


# cull_elements = (target, cull)->
#     offset = 0
#     while cull.length > 0
#         target.splice (cull.pop() - offset), 1
#         offset++
#     return target

# nu_arrows = cull_elements arrows, cull

# c "now arrows", nu_arrows


unique_arrows_000 = (arrows)->
    cull = []
    for idx in [0 .. (arrows.length - 2)]
        for jdx in [(idx + 1) .. (arrows.length - 1)]
            if (arrows[idx][0] is arrows[jdx][0]) and (arrows[idx][1] is arrows[jdx][1])
                cull.push jdx
    offset = 0
    while cull.length > 0
        arrows.splice (cull.pop() - offset), 1
        offset++
    return arrows


sparrows_unique = unique_arrows_000 sparrows

c "sparrows_unique", sparrows_unique, "sparrows_unique.length", sparrows_unique.length














