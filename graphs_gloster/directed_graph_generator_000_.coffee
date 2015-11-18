c = -> console.log.apply console, arguments


###
from wikipedia
In mathematics, and more specifically in graph theory, a directed graph (or digraph) is a graph, or set of vertices connected by edges, where the edges have a direction associated with them. In formal terms, a directed graph is an ordered pair G = (V, A) (sometimes G = (V, E)) with[1]

    V a set whose elements are called vertices, nodes, or points;
    A a set of ordered pairs of vertices, called arrows, directed edges (sometimes simply edges with the corresponding set named E instead of A), directed arcs, or directed lines.

###



_ = require 'lodash'

clone_rayy = (rayy)->
    clone = []
    for i, idx in rayy
        clone[idx] = i
    return clone


random_index_in = (top_index)->
    return Math.floor(Math.random() * (top_index + 1))

class Directed_Graph_000
    unique = (arrows)->
        c "arrows", arrows
        for arrow, idx in arrows
            clone = clone_rayy arrows
            clone.splice idx, 1
            c "clone", clone, idx
            duplicates_rayy = []
            for arrow_2, idx_2 in clone

                if (arrow[0] is arrow_2[0]) and (arrow[1] is arrow_2[1])
                    c "hey"
                    duplicates_rayy.push idx_2
        offset = 0
        sparrows = clone_rayy arrows
        c "sparrows", sparrows
        c "duplicates_rayy.length", duplicates_rayy.length
        for index, idx in duplicates_rayy
            c "index of duplicate", index
            sparrows.splice (index - offset), 1
            offset++
        return sparrows


    constructor: (num_vertices, num_arrows)->
        @arrows_000 = for i in [0 .. (num_arrows - 1)]
            idx_a = random_index_in (num_vertices - 1)
            copy = [0 .. (num_vertices - 1)]
            copy.splice(idx_a, 1)
            idx_b = copy[random_index_in(num_vertices - 2)]
            [idx_a, idx_b]
        @arrows_001 = unique @arrows_000




        @vertices = [0 ..(num_vertices - 1)]




graph_000 = new Directed_Graph_000 3, 6


c graph_000

c graph_000.arrows_000.length
c graph_000.arrows_001.length








