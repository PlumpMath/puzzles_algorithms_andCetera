
c = -> console.log.apply console, arguments

moves =
    one: [1, 2]
    two: [2, 1]
    three: [2, -1]
    four: [1, -2]
    five: [-1, -2]
    six: [-2, -1]
    seven: [-2, 1]
    eight: [-1, 2]

slope_cutoff = .5 + ((2 - 0.5) / 2)  # halfway between slopes 2 and .5

auto_homing = "auto_homing"

get_quadrant = (delta_x, delta_y)->
    if delta_y >= 0
        if delta_x >= 0
            return 1
        else
            return 4
    else
        if delta_x >= 0
            return 2
        else
            return 3

get_slope = (delta_x, delta_y)->
    Math.abs(delta_y / delta_x)

exports.distance = distance = (delta_x, delta_y)->
    Math.sqrt(Math.pow(delta_y, 2) + Math.pow(delta_x, 2))

exports.trajectory = trajectory = (origin, target)->
    delta_y: target[1] - origin[1]
    delta_x: target[0] - origin[0]

exports.move_choice = move_choice = (origin, target, move_num)->
    {delta_x, delta_y} = trajectory(origin, target)
    if distance(delta_x, delta_y) < 13
        return auto_homing
    quadrant = get_quadrant delta_x, delta_y
    slope = get_slope delta_x, delta_y
    if move_num % 10 is 0
        # c 'quadrant', quadrant
        c 'slope', slope
    switch quadrant
        when 1
            if slope >= slope_cutoff then return moves.one else return moves.two
        when 2
            if slope >= slope_cutoff then return moves.four else return moves.three
        when 3
            if slope >= slope_cutoff then return moves.five else return moves.six
        when 4
            if slope >= slope_cutoff then return moves.eight else return moves.seven


# c move_choice([0, 0], [10, 90])
# c move_choice([0, 0], [-10, 90])
