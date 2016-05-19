

c = -> console.log.apply console, arguments
_ = require 'lodash'
# c '_', _

move_image_spec = "
Given a square (a, b), calculate the set (image) of all possible destination squares.
Number them one through eight.
"

vec_equal = (rayy_0, rayy_1)->
    (rayy_0[0] is rayy_1[0]) and (rayy_0[1] is rayy_1[1])

move_image = (square)->
    a = square[0]
    b = square[1]
    return [
        [a + 2, b + 1],
        [a + 2, b - 1],
        [a + 1, b + 2],
        [a + 1, b - 2],
        [a - 2, b + 1],
        [a - 2, b - 1],
        [a - 1, b - 2],
        [a - 1, b + 2]
    ]

okay_000 = "
So now we can apply this in succession to every member of our growing set.
If we have a function which checks our set for the target square then we can do this repeatedly until we arrive at a set with our target square and we will have the answer.
"

check_set_for_target = (rayy, target)->
    # rayy is the array of ordered pairs; (a, b) the target square represented by ordered pair
    a = target[0]
    b = target[1]
    for square, idx in rayy
        if (a is square[0]) and (b is square[1])
            return true
    return false

okay_001 = "
Now to build out the object of (number_moves) => image_set.
"

populate_set_from_set = (set)->
    new_set = []
    for square, idx in set
        # c 'square', square
        image = move_image square
        for square_2, jdx in image
            new_set.push square_2
    # c 'new_set in populating', new_set
    new_set

image_1 = populate_set_from_set [[0, 0]]

c 'image_1', image_1

add_set_to_set = (set_0, set_1)->
    for square, idx in set_1
        if (check_set_for_target(set_0, square) is false)
            set_0.push square
    return set_0

subtract_intersection_from_set = (culling_set, target_set)->
    # any members of intersection of target_set and culling_set removed from returned_set
    set_to_return = []
    for square, idx in target_set
        if check_set_for_target(culling_set, square) is false
            set_to_return.push square
    set_to_return

{distance, move_choice, trajectory} = require './direct_trajectory.coffee'

locate_number_of_moves_to_reach_target = (target)->
    starting_origin = [0, 0]
    origin = [0, 0]
    number_of_moves = 0
    starting_set = [starting_origin]
    target_achieved = false
    cursor_set = [origin]
    culling_set = []

    while not target_achieved
        number_of_moves += 1
        {delta_x, delta_y} = trajectory(origin, target)
        if number_of_moves % 10 is 0
            c distance(delta_x, delta_y)
        if distance(delta_x, delta_y) >= 13
            move = move_choice origin, target, number_of_moves
            c 'move', move
            new_position = [origin[0] + move[0], origin[1] + move[1]]
            new_set = [new_position]
            target_achieved = check_set_for_target new_set, target
            # c 'DIRECTED: is target achieved ?', target_achieved
            origin = new_position
            cursor_set = [origin]
        else
            domain_set = subtract_intersection_from_set(culling_set, cursor_set)
            new_set = populate_set_from_set domain_set
            culling_set = add_set_to_set(culling_set, domain_set)
            # c 'new_set.length', new_set.length
            # culled_set_two = subtract_intersection_from_set(culling_set, new_set)
            target_achieved = check_set_for_target new_set, target
            # c 'is target achieved ?', target_achieved
            # culling_set = add_set_to_set(culling_set, new_set)
            # culled_set = subtract_intersection_from_set(culling_set, cursor_set)
            cursor_set = new_set
            c "AUTOHOMING: number_of_moves", number_of_moves
        # c 'target_achieved', target_achieved
    return number_of_moves

c 'final', locate_number_of_moves_to_reach_target [-15830, 15847]
