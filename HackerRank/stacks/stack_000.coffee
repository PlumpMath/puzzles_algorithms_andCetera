# Enter your code here
c = -> console.log.apply console, arguments

stdin = process.openStdin()
stdin.setEncoding 'utf8'

func_001 = (rayy, q_card) ->
    rayy.shift()
    stack = []
    output = ''
    max_counter = 0
    true_max_counter = 0
    for q, idx in rayy
        switch q[0]
            when '1'
                # if idx < 100
                #     cursor = q.split(' ')[1]
                #     c "pushing: #{cursor}"
                #     c "onto stack", stack
                stack.push parseInt(q.split(' ')[1])
            when '2'
                popped = stack.pop()
                # if idx < 100
                #     c 'popping', popped
            when '3'
                max = null
                for num in stack
                    # if max_counter is 5
                    #     c 'num', 'max', num, max
                    #     c typeof(num), typeof(max)
                    #     c (num > max)
                    if (max is null) or (num > max)
                        max = num
                output += "#{max}\n"
                true_max_counter = true_max_counter + 1
                if idx < 100
                    c 'stack now', stack
                    c "max now at #{max_counter}: ", max
                    max_counter = max_counter + 1
    c 'true_max_counter', true_max_counter
    return output



func_000 = (rayy, q_card) ->

    stack = []
    # for q in rayy
    for idx in [0 .. (q_card - 1)]
        q = rayy[idx]
        switch q[0]
            when '1'
                stack.push parseInt(q.split(' ')[1])
            when '2'
                stack.pop()
            when '3'
                max = null
                for num in stack
                    if (max is null) or (num > max)
                        max = num
                c max



func_002 = (rayy, q_card) ->
    # rayy.shift()
    stack = []
    output = ''
    max_counter = 0
    true_max_counter = 0
    # for q, idx in rayy
    for idx in [0 .. (q_card - 1)]
        q = rayy[idx]
        # if (100000 - idx) < 50
        #     c('q here', q)
        switch q[0]
            when '1'
                # if idx < 100
                #     cursor = q.split(' ')[1]
                #     c "pushing: #{cursor}"
                #     c "onto stack", stack
                stack.push parseInt(q.split(' ')[1])
            when '2'
                popped = stack.pop()
                # if idx < 100
                #     c 'popping', popped
            when '3'
                max = null
                for num in stack
                    # if max_counter is 5
                    #     c 'num', 'max', num, max
                    #     c typeof(num), typeof(max)
                    #     c (num > max)
                    if (max is null) or (num > max)
                        max = num
                output += "#{max}\n"
                true_max_counter = true_max_counter + 1
    #             if idx < 100
    #                 c 'stack now', stack
    #                 c "max now at #{max_counter}: ", max
    #                 max_counter = max_counter + 1
    # c 'true_max_counter', true_max_counter
    return output





func_003 = (rayy, q_card) ->
    stack = []
    maxes = [0]
    output = ''

    add_to_maxes = (cursor) ->
        for num, idx in maxes
            if cursor > num
                maxes.splice idx, 0, cursor
                break

    for idx in [0 .. (q_card - 1)]
        q = rayy[idx]
        switch q[0]
            when '1'
                cursor = parseInt(q.split(' ')[1])
                stack.push cursor
                if cursor > maxes[0]
                    add_to_maxes cursor
            when '2'
                popped = stack.pop()
                if maxes.indexOf(popped) isnt -1
                    maxes.splice(maxes.indexOf(popped), 1)
            when '3'
                output += "#{maxes[0]}\n"
    return output

func_004 = (rayy, q_card) ->
    stack = []
    maxes = {}
    output = ''
    for idx in [0 .. (q_card - 1)]
        q = rayy[idx]
        switch q[0]
            when '1'
                cursor = parseInt(q.split(' ')[1])
                stack.push cursor
                if maxes[cursor] is undefined
                    # c 'undef'
                    maxes[cursor] = 1
                else
                    maxes[cursor] = maxes[cursor] + 1
            when '2'
                # c 'popped'
                popped = stack.pop()
                maxes[popped] = maxes[popped] - 1
            when '3'
                rayy2 = for num in Object.keys(maxes)
                    parseInt(num)
                max = rayy2[0]
                for idx2 in [1 .. (rayy2.length - 1)]
                    if rayy2[idx2] > max
                        max = rayy2[idx2]
                output += "#{max}\n"
    return output


fs = require 'fs'
input0 = fs.readFileSync('./input_test-case_24').toString()
output0 = fs.readFileSync('./output_test-case_24').toString()
input1 = fs.readFileSync('./input_001').toString()
output1 = fs.readFileSync('./output_001').toString()
rayy1 = input1.split('\n')
q_card1 = rayy1.shift()
rayy0 = input0.split('\n')
q_card0 = rayy0.shift()

output_candide0 = func_003(rayy0, q_card0)
output_candide1 = func_003(rayy1, q_card1)
# c 'output_candide.length', output_candide.length
cand_out_rayy0 = output_candide0.split('\n')
out_rayy0 = output0.split('\n')
cand_out_rayy1 = output_candide1.split('\n')
out_rayy1 = output1.split('\n')
c 'cand_out_rayy0.length', cand_out_rayy0.length
c 'out_rayy0.length', out_rayy0.length
c 'cand_out_rayy1.length', cand_out_rayy1.length
c 'out_rayy1.length', out_rayy1.length
# for i in [0 .. 100]
#     c("cand    at #{i}  : ", cand_out_rayy[i])
#     c("actual  at #{i}  : ", out_rayy[i])
problem1 = []
for i in [0 .. (out_rayy1.length - 1)]
    if cand_out_rayy1[i] != out_rayy1[i]
        # c "unequal at: #{i} ", cand_out_rayy[i], out_rayy[i]
        problem1.push i

c 'problem1', problem1.length
problem0 = []
for i in [0 .. (out_rayy0.length - 1)]
    if cand_out_rayy0[i] != out_rayy0[i]
        # c "unequal at: #{i} ", cand_out_rayy[i], out_rayy[i]
        problem0.push i

c 'problem0', problem0.length
    # else
        # c 'equal'
# c 'q_card', q_card
# c 'now rayy[0]', rayy[0]
#
# stdin.on 'data', (input) ->
#     #c 'input', typeof(input)
#     rayy = input.split('\n')
#     #c 'rayy', rayy
#
#     func_000 rayy
