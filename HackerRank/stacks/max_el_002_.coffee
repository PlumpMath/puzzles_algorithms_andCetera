


c = -> console.log.apply console, arguments
fs = require 'fs'
_ = require 'lodash'

# stdin = process.openStdin()
# stdin.setEncoding 'utf8'


class Daaf
    constructor: (value) ->
        @value = value
        @counter = 0
    incr_counter: ->
        @counter++





func_003 = (rayy, q_card) ->
    initial_max = new Daaf(0)
    stack = [initial_max]
    output = ''
    for idx in [0 .. (q_card - 1)]
        cursor = rayy[idx]
        switch cursor[0]
            when '1'
                val = parseInt(cursor.split(' ')[1])
                if val > stack[0].value
                    nu_daaf = new Daaf(val)
                    stack.unshift(nu_daaf)
                else
                    stack[0].counter++
            when '2'
                if stack[0].counter > 0
                    stack[0].counter--
                else if (stack[0].counter is 0) and (stack[0].value isnt 0)
                    stack.shift()
            when '3'
                output += stack[0].value + '\n'
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
            problems.push i
    c "number of problems for test case #{key}: ", problems.length



# func_000 = ->
#     rayy = input.split('\n')
#     card = rayy.shift()
#     output = func_003(rayy, card)
#     c output
#
#
#
#
# process.stdin.resume()
# process.stdin.setEncoding 'ascii'
# _input = ''
# process.stdin.on 'data', (input)->
#     _input += input
# process.stdin.on 'end', ->
#     func_000 _input
