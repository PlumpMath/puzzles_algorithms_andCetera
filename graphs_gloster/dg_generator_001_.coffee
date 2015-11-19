c = -> console.log.apply console, arguments

random_index_in = (top_index)->
    return Math.floor(Math.random() * (top_index + 1))

get_quiver_000 = (top_index, size)->
    arrows = for i in [0 .. (size - 1)]
        index_a = random_index_in top_index
        copy_minus = [0 .. (size - 1)]
        copy_minus.splice index_a, 1
        index_b = copy_minus[random_index_in (top_index - 1)]
        [index_a, index_b]

    return arrows

sparrows = get_quiver_000 4, 8

c "sparrows", sparrows, "sparrows.length", sparrows.length

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

quiver_contains_000 = (quiver, candide)->
    for arrow in quiver
        if arrow_equals_000(candide, arrow)
            return true
    return false

arrow_equals_000 = (arrow_a, arrow_b)->
    if (arrow_a[0] is arrow_b[0]) and (arrow_a[1] is arrow_b[1])
        return true
    else
        return false

clone_rayy = (rayy)->
    clone = []
    for i, idx in rayy
        clone[idx] = i
    return clone

quiver_all_unique_000 = (quiver)->
    for arrow, idx in quiver
        quiver_clone = clone_rayy quiver
        quiver_clone.splice idx, 1
        if quiver_contains_000(quiver_clone, arrow)
            return false
    return true

get_dg = get_quiver_001 = (top_index, size)->
    quiver = []
    cursive_novel_arrow = ->
        index_a = random_index_in top_index
        copy_minus = [0 .. (size - 1)]
        copy_minus.splice index_a, 1
        index_b = copy_minus[random_index_in (top_index - 1)]
        candide = [index_a, index_b]
        if not(quiver_contains_000(quiver, candide))
            return candide
        else
            return arguments.callee()
    for i in [0 ..(size - 1)]
        quiver.push cursive_novel_arrow()
    return quiver


sparrows = get_quiver_000 4, 8

c "sparrows", sparrows, "sparrows.length", sparrows.length

c "sparrows unique", quiver_all_unique_000(sparrows)



sparrows_001 = get_quiver_001 4, 8
c "sparrows_001", sparrows_001, "sparrows_001.length", sparrows_001.length

c "sparrows_001 unique", quiver_all_unique_000(sparrows_001)


# class Directed_Graph_001

#     constructor: 


