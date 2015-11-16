c = -> console.log.apply console, arguments

c "\n Write an algorithmm to print all ways of arranging eight queens on a chess
 board so that none of them share the same row, column, or diagonal. \n "

c " solution strategy:  It's plain that there will be a queen on each row and a queen on each column, so we can eg place all the queens in one of the main diagonals and then 
permute either the rows or the columns.  There will be only 8! permutations, and each of these can be tested for to pass no diags rule by brute force."

c "\n Put another way, we can construct a set of 8 columns provided that each has 
a queen on a different square within the column.  This is equivalent to saying
that each piece is on a different row.  We know that all of the solutions can 
be characterised by some permutation of these columns, so it just remains to 
enumerate the permutations of the columns and check which yield solutions.
\n \n"

# board should be in same format as columns variable above ; an array of arrays
check_for_diagonal_hit = (board)->
    # strategy:  we go through the board by columns with a for loop
    # first we establish the location of the column with respect to the other
    # columns, then we establish the location of the queen.  
    # then we go right and left by columns
    queen_idx = (column) ->
        for square, idx in column
            if square is on
                return idx
                # break
    # bangs = 0
    # done = 0
    for column, idx in board
        # c "column", column
        # if idx is 0 we only go to the right
        # if idx is 7 we only go to the left
        # if 0 < idx < 7 we go left idx steps and right (7 - idx steps)
        ref_queen_idx = queen_idx column

        # go right
        if idx < 7
            for col_offset_idx in [1 .. (7 - idx)]
                compare_queen_idx = queen_idx(board[idx + col_offset_idx])
                if ( Math.abs(compare_queen_idx - ref_queen_idx) is col_offset_idx)
                    # c "bang bang and return hit conflict dead bad no solution here."
                    return true
                    # bangs++
        if idx > 0
            #go left
            for col_offset_idx in [1 .. (idx)]
                compare_queen_idx = queen_idx(board[idx - col_offset_idx])
                if ( Math.abs(compare_queen_idx - ref_queen_idx) is col_offset_idx)
                    # c "bang bang on the downside"
                    return true
                    # bangs++
        # done++
    #     c "done ? #{done}"
    # c "done 2"
    # c "bangs number: #{bangs}"
    return false






seed = (board)->
    for i in [0 .. 7]
        column = [off, off, off, off, off, off, off, off]
        column[i] = on
        # c "column", column
        board.push column
    return board




# c "columns \n", columns


board = []
board_000 = seed board
c check_for_diagonal_hit board_000


factorial_000 = (n)->
    factor = n - 1
    result = n
    while factor > 1
        result *= factor
        factor--
    return result

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

c "board_000 \n", board_000


enumerated_boards = enumerate_permutations_001 board_000

c enumerated_boards.length

c enumerated_boards[0]

c enumerated_boards[1]

solutions = []

for board, idx in enumerated_boards
    if not(check_for_diagonal_hit(board))
        solutions.push board

c "solutions length", solutions.length

# c solutions[0]

# c solutions[1]

for solution in solutions
    c solution


