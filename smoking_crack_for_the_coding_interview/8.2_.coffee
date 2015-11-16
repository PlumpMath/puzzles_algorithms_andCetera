
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
the same function for each reduced ~~path~~ space.  
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
    # c "satchel", satchel
    return satchel

# delta = {row, column}
# start_pos = {row, column}
step_path_000 = (start_pos, delta)->
    return {row: (start_pos.row + delta.row), column: (start_pos.column + delta.column)}

get_delta_from_step_000 = (step_string)->
    switch step_string
        when 'down'
            return {row: 1, column: 0}
        when 'right'
            return {row: 0, column: 1}

# target  {row, column}
# path rayy is same as output of path_enumerator_001
path_transits_target_000 = (path_rayy, target)->
    c "\n entre \n"
    nu_pos = {row: 0, column: 0}
    step = null
    idx = 0
    while step isnt 'stop'
        step = path_rayy[idx]
        c "step #{step}"
        if step is 'stop'
            return false
        delta = get_delta_from_step_000 step
        nu_pos = step_path_000 nu_pos, delta
        c "nu_pos", nu_pos
        c "target", target
        if (nu_pos.row is target.row) and (nu_pos.column is target.column)
            c "returning true"
            return true
        idx++


# same as above but we get another argument obstacles_rayy , 
# an array of obstacle grid squares.
# this one isn't recursive so assume pos_m, and pos_n of 0, 0
path_enumerator_002 = (bounds_M, bounds_N, obstacles_rayy) ->
# strategy , make use of path_enumerator_001, to enumerate the paths
# as if there were no obstacles.  then we make another function which
# checks a path to see if it goes through particular squares.  then 
# we can eliminate those.
    preliminary_list = path_enumerator_001(bounds_M, bounds_N, 0, 0)
    satchel = []

    for path in preliminary_list
        mined = false
        for target in obstacles_rayy
            if path_transits_target_000(path, target)
                mined = true
        if mined is false
            satchel.push path
    return satchel

obstacles_rayy = [
    {row: 0, column: 2},
    {row: 2, column: 0}
]

test_with_obstacles = ->
    zz = path_enumerator_002(3, 3, obstacles_rayy)
    c "zz", zz
    c "zz.length #{zz.length}"


mark_a = 0
run_test = ->
    mark_a = 0
    zz = path_enumerator_001(3, 3, 0, 0)
    c "zz", zz
    c "mark_a #{mark_a}"
    c "zz.length #{zz.length}"

# run_test()

test_with_obstacles()








