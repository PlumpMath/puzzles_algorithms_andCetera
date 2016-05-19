
c = -> console.log.apply console, arguments
Array.prototype.clone = -> return @.slice(0)

# input = "2\n4 2\n1 2\n1 3\n1\n3 1\n2 3\n2"

# finds all nodes adjacent to a given node s
find_adj = (s, edges, acc) ->
    # c 's, edges, acc', s, edges, acc
    # c typeof s
    idx = 0
    while (idx < edges.length)
        edge = edges[idx]
        s_idx = edge.indexOf(s)
        switch s_idx
            when 0
                edges.splice(idx, 1)
                acc.push edge[1]
                arguments.callee(s, edges, acc)
            when 1
                edges.splice(idx, 1)
                acc.push edge[0]
                arguments.callee(s, edges, acc)
            # when -1 # do nothing in this case
        idx++
    return {
        acc: acc
        edges: edges
    }

#finds all nodes adjacent to a set of given nodes sett
# the union of all sets of adjacent to individual nodes in the set sett
find_adj_to_set = (sett, edges) ->
    # c 'sett, edges', sett, edges
    union = []
    # acc = []
    for node in sett
        if edges.length > 0
            {acc, edges} = find_adj(node, edges, [])
            for adj_node in acc
                if union.indexOf(adj_node) is -1
                    union.push adj_node
    return union

find_shortest_path = (s, n, edges) ->
    distance = 0
    union = [s]
    last = edges.length + 1
    while (edges.length > 0) and (edges.length < last)
        distance++
        pre = find_adj_to_set(union, edges)
        union = union.concat(pre)
        last = edges.length
        if union.indexOf(n) isnt -1
            return {
                found: true
                distance: distance
            }
    return {
        found: false
    }

run_test_case = (test_case) ->
    {contents, edges, S} = test_case
    N = parseInt(contents[0])
    # c 'number of nodes', N
    M = parseInt(contents[1])

    output = ''
    for n in [1 .. N]
        if n isnt S
            shortest_path = find_shortest_path(S, n, edges.clone())
            # c 'shortest_path', shortest_path
            if shortest_path.found is true
                distance = shortest_path.distance * 6
            else
                distance = -1
            # c 'distance', distance
            output = output + distance + ' '
    return output

parse_input = (input) ->
    rayy = input.split('\n')

    T = rayy.shift()
    output = ''
    while rayy.length > 0
        contents = [N, M] = rayy.shift().split(' ')

        edges = []
        for idx in [1 .. M]
            pair = [x, y] = rayy.shift().split(' ')
            pair = [parseInt(pair[0]), parseInt(pair[1])]
            edges.push pair
        S = parseInt(rayy.shift())

        line = run_test_case({contents, edges, S})
        # c 'line', line
        output = output + line + '\n'
    c output


# c 'output finally :\n', output

# adj_test_data = [[1,2], [8, 18], [1,3], [1, 4], [6, 7]]
#
# test_data_2 = adj_test_data.clone()
#
# x = find_adj(1, adj_test_data, [])
#
# c 'x', x
#
# y = find_adj_to_set([1, 8], test_data_2)
#
# c 'y', y
