c = -> console.log.apply console, arguments

# testing a simplified shunting-yard algorithm on a randomly generated arithmetic expression

c 'shunting '


random_expression_string_builder = (nn) ->
    rayy_builder = (n) ->
        operators = ['+', '-', '*', '/']
        operands_rayy = []
        operators_rayy = []
        for i in [0 .. (n - 1)]
            operands_rayy.push Math.floor((Math.random() - .000000001) * 10)
        for i in [0 .. (n - 2)]
            operators_rayy.push operators[Math.floor(Math.random() * 4)]
        ret =
            operands_rayy: operands_rayy
            operators_rayy: operators_rayy
    satch = rayy_builder nn
    opnds = satch.operands_rayy
    opers = satch.operators_rayy
    strang = ""
    for i in [0 .. (nn - 1)]
        if i < (nn - 1)
            # strang += opnds[i] + ' ' + opers[i] + ' '
            strang += opnds[i] + opers[i]
        else
            strang += opnds[i]
    return strang

precedence = (a) ->
    switch a
        when '+', '-'
            return 0
        when '*', '/'
            return 1

parse_primary = (a, b, op)->
    a = parseFloat a ; b = parseFloat b
    switch op
        when '+'
            return a + b
        when '-'
            return a - b
        when '*'
            return a * b
        when '/'
            return a / b

is_operator = (token)->
    if (token is '+') or (token is '-') or (token is '*') or (token is '/')
        return true
    else
        return false

is_operand = (token)->
    if (token is '+') or (token is '-') or (token is '*') or (token is '/')
        return false
    else
        return true

algo_000 = (rayy) ->
    output_queue = []
    operator_stack = []
    c 'algo', rayy
    i = 0
    while i < rayy.length
        c 'token', rayy[i]
        token = rayy[i]
        if is_operator(token) is false
            output_queue.push token
            c 'pushed number', output_queue
        else
            c 'else'
            operator = rayy[i]
            while (operator_stack.length > 0) and (precedence(operator) <= precedence(operator_stack[operator_stack.length - 1]))
                c 'in while'
                output_queue.push operator_stack.pop()
                c 'output_queue', output_queue
                c 'operator_stack', operator_stack
            operator_stack.push operator
        i++
    c "\n now stack: \n", operator_stack
    while operator_stack.length > 0
        output_queue.push operator_stack.pop()
    c "\n now output_queue", output_queue
    return output_queue

evalu_postfix = (rayy) ->
    c 'evalu_postfix input', rayy
    # given a postfix expression, evaluate it
    stack = []
    while rayy.length > 0
        cursor = rayy.shift()
        c 'cursor', cursor
        if is_operand(cursor)
            stack.push cursor
        else
            temp = stack.pop()
            ret_val = parse_primary(stack.pop(), temp, cursor)
            c 'ret_val', ret_val
            stack.push ret_val
        c stack
    return stack.pop()




strang_000 = random_expression_string_builder 4
c 'strang_000', strang_000
rayy = strang_000.split ''
c rayy
postfix = algo_000 rayy
c 'postfix', postfix
c evalu_postfix postfix

c eval strang_000