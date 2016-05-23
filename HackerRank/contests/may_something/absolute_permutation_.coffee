c = -> console.log.apply console, arguments


input_000 = "3\n2 1\n3 0\n3 2"

input_001 = "1\n16 4"


parse_input = (strang) ->
    rayy_000 = strang.split '\n'
    card = rayy_000.shift()
    rayy_001 = for strang_001 in rayy_000
        rayy_002 = strang_001.split(' ')
        {
            N: rayy_002[0]
            K: rayy_002[1]
        }

position_K_abs = (pos, i, K) ->
    if Math.abs(pos - i) is K
        return true
    else
        return false

find_permutation = (pair) ->

    {N, K} = pair
    N = parseInt(N)
    K = parseInt(K)

    natural_order = [1 .. N]
    perm = []
    # c natural_order
    if K is 0
        return natural_order.join(' ')
    if N % 2 isnt 0
        return -1
    if (N % (2 * K)) isnt 0
        return -1

    for i in [0 .. ((N / (2 * K)) - 1)]
        for j in [0 .. (K - 1)]
            idx = (i * (2 * K)) + j
            idx2 = idx + K
            perm[idx] = natural_order[idx2]
            perm[idx2] = natural_order[idx]

    return perm.join(' ')









func_000 = (input) ->
    rayy = parse_input(input)
    output = ''
    for pair in rayy
        perm = find_permutation(pair)
        output += "#{perm}\n"

    c output


# func_000 input_001

process.stdin.resume()
process.stdin.setEncoding 'ascii'
_input = ''
process.stdin.on 'data', (input)->
    _input += input
process.stdin.on 'end', ->
    func_000 _input
