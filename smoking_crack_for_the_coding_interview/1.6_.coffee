c = -> console.log.apply console, arguments

# rotate an n x n matrix

rotate = (matrix, n)->
    for layer in [0 .. (n / 2)]
        first = layer
        last = n - 1 - layer
        for i in [first .. (last - 1)]
            offset = i - first
            top = matrix[first][i] # save top
            # left -> top
            matrix[first][i] = matrix[last - offset][first]

            # bottom -> left
            matrix[last - offset][first] = matrix[last][last - offset]

            # right -> bottom
            matrix[last][last - offset] = matrix[i][last]

            # top -> right
            matrix[i][last] = top
