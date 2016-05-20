c = -> console.log.apply console, arguments
fs = require 'fs'
_ = require 'lodash'

data_raw = fs.readFileSync('./data/balanced_parens/data_000').toString()

rayy_000 = data_raw.split '\n'
data_count = rayy_000.shift()

c data_count


#----------------------------------------------------------

c = -> console.log.apply console, arguments

class Page
    constructor: (glyph, parent_stack) ->
        @glyph = glyph
        @parent_stack = parent_stack
        @child_stack = []

same_glyph_type = (glyph_1, glyph_2) ->
    switch glyph_1
        when '(', ')'
            if ( glyph_2 is '(' ) or ( glyph_2 is ')' )
                return true
            else
                return false
        when '[', ']'
            if ( glyph_2 is '[' ) or ( glyph_2 is ']' )
                return true
            else
                return false
        when '{', '}'
            if ( glyph_2 is '{' ) or (glyph_2 is '}' )
                return true
            else
                return false

open_glyph = (candide_glyph) ->
    if ( candide_glyph is '(' ) or ( candide_glyph is '[' ) or ( candide_glyph is '{' )
        return true
    else
        return false


func_000 = (line) ->

    glyph = line.shift()
    if not open_glyph(glyph)
        return false
    root_stack = []
    parent_stack = null
    current_stack = root_stack
    current_stack.unshift(new Page(glyph, parent_stack))

    while (line.length > 0)
        glyph = line.shift()
        if (open_glyph(glyph))
            if current_stack.length is 0
                current_stack.unshift(new Page(glyph, parent_stack))
            else if (glyph is current_stack[0].glyph)
                current_stack.unshift(new Page(glyph, parent_stack))
            else # new glyph so child stack create
                parent_stack = current_stack
                current_stack[0].child_stack.unshift(new Page(glyph, parent_stack))
                current_stack = current_stack[0].child_stack
        else #is closing bracket
            if current_stack.length is 0
                return false
            else
                if (same_glyph_type(glyph, current_stack[0].glyph))
                    page = current_stack.shift()
                    if (current_stack.length is 0) and (page.parent_stack isnt null)
                        current_stack = page.parent_stack
                    else if (current_stack.length is 0) and (page.parent_stack is null)
                        x = "already"
                    else
                        x = "already"


                    # if (current_stack.length is 1) and (parent_stack isnt null)
                    #     current_stack = current_stack.shift().parent_stack
                    # else if (current_stack.length is 1) and (parent_stack is null)
                    #     current_stack.shift()
                    # else
                    #     current_stack.shift()
                else
                    return false

    if root_stack.length is 0
        return true
    else
        return false



func_001 = (rayy) ->
    output = ''
    for strang in rayy
        line = strang.split ''
        output_000 = func_000(line)
        if output_000 is true
            strang_rep = 'YES'
        else
            strang_rep = 'NO'
        output += ( strang_rep  + '\n' )
    return output

func_002 = (input) ->
    rayy = input.split('\n')
    card = rayy.shift()
    output = func_001(rayy)
    c output




# process.stdin.resume()
# process.stdin.setEncoding 'ascii'
# _input = ''
# process.stdin.on 'data', (input)->
#     _input += input
# process.stdin.on 'end', ->
#     func_002 _input



#-------------------------------------





# c rayy_000
# for strang in rayy_000
#     # c 'line', line.length
#
#     line = strang.split ''
#     x = func_000 line
#     c x


data_info =
    test_case_1:
        input: 'input_1'
        output: 'output_1'
    test_case_10:
        input: 'input_10'
        output: 'output_10'


data = _.reduce data_info, (acc, val, key) ->
    acc[key] = {}
    acc[key].input = fs.readFileSync("./data/balanced_parens/#{val.input}").toString()
    acc[key].output = fs.readFileSync("./data/balanced_parens/#{val.output}").toString()
    return acc
, {}

# c 'data', _.keys(data)

for key, value of data
    input = value.input
    rayy = input.split('\n')
    card = rayy.shift()
    data[key].candide_output = func_001(rayy)
    problems = []
    for i in [0 .. (data[key].output.length - 1)]
        if data[key].candide_output[i] != data[key].output[i]
            problems.push i
            c 'candide: ', data[key].candide_output[i]
            c 'expected: ', data[key].output[i]
    c "number of problems for test case #{key}: ", problems.length
