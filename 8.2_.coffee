
c = -> console.log.apply console, arguments

c "Imagine a robot sitting on the upper left hand corner of an NxN grid.
The robot can only move in two directions: right and down. How many possible paths
are there for the robot? \n
FOLLOW UP \n
Imagine certain squares are \"off limits\", such that the robot can not step on them. 
Design an algorithm to get all possible paths for the robot.
\n
"

c "Strategy:  \n Very much the same dynamic as the string permutation; 
we enumerate all the possible immediate steps and then call recursively
the same function for each reduced path.  
\n
"



path_enumerator_001 = (bounds_M, bounds_N, pos_m, pos_n)->
    # c "pos_m #{pos_m}, pos_n #{pos_n}"
    satchel = []
    already = false
    if pos_n < bounds_N
        n_list = arguments.callee bounds_M, bounds_N, pos_m, (pos_n + 1)
        for path, idx in n_list
            path.unshift 'right'
        for path, idx in n_list
            satchel.splice satchel.length, 0, path

    if pos_m < bounds_M
        m_list = arguments.callee bounds_M, bounds_N, (pos_m + 1), pos_n
        for path, idx in m_list
            path.unshift 'down'
        for path, idx in m_list
            satchel.splice satchel.length, 0, path

    if (pos_n is bounds_N) and (pos_m is bounds_M)
        satchel.splice satchel.length, 0, ['stop']
        mark_a++
        c "cheese"
    # c "satchel", satchel
    return satchel


mark_a = 0
run_test = ->
    mark_a = 0
    zz = path_enumerator_001(3, 3, 0, 0)
    c "zz", zz
    c "mark_a #{mark_a}"
    c "zz.length #{zz.length}"

run_test()








