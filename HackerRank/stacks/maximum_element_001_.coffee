c = -> console.log.apply console, arguments
_ = require 'lodash'
fs = require 'fs'

stdin = process.openStdin()
stdin.setEncoding 'utf8'


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

data_info =
    u_000:
        input: 'input_000'
        output: 'output_000'
    u_001:
        input: 'input_001'
        output: 'output_001'
    test_case_24:
        input: 'input_test-case_24'
        output: 'output_test-case_24'
    test_case_27:
        input: 'input_test-case_27'
        output: 'output_test-case_27'

data = _.reduce data_info, (acc, val, key) ->
    acc[key] = {}
    acc[key].input = fs.readFileSync("./data/#{val.input}").toString()
    acc[key].output = fs.readFileSync("./data/#{val.output}").toString()
    return acc
, {}

# c 'data', _.keys(data)

for key, value of data
    input = value.input
    rayy = input.split('\n')
    card = rayy.shift()
    data[key].candide_output = func_003(rayy, card)
    problems = []
    for i in [0 .. (data[key].output.length - 1)]
        if data[key].candide_output[i] != data[key].output[i]
            problem.push i
    c "number of problems for test case #{key}: ", problems.length
