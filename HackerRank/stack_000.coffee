# Enter your code here
c = -> console.log.apply console, arguments

stdin = process.openStdin()
stdin.setEncoding 'utf8'


func_000 = (rayy) ->
    rayy.shift()
    stack = []
    for q in rayy
        #c 'q', q
        #c typeof(q)

        switch q[0]
            when '1'
                stack.push q.split(' ')[1]
            when '2'
                stack.pop()
            when '3'
                max = null
                for num in stack
                    if (max is null) or (num > max)
                        max = num
                c max


func_001 = (rayy) ->
    rayy.shift()
    stack = []
    output = ''
    for q, idx in rayy
        switch q[0]
            when '1'
                if idx < 100
                    cursor = q.split(' ')[1]
                    c "pushing: #{cursor}"
                stack.push q.split(' ')[1]
            when '2'
                stack.pop()
            when '3'
                max = null
                for num in stack
                    if (max is null) or (num > max)
                        max = num
                output += "#{max}\n"
    return output



fs = require 'fs'
input = fs.readFileSync('./input_000').toString()
output = fs.readFileSync('./output_000').toString()

rayy = input.split('\n')
output_candide = func_001 rayy
c 'output_candide.length', output_candide.length

cand_out_rayy = output_candide.split('\n')
out_rayy = output.split('\n')
c 'cand_out_rayy.length', cand_out_rayy.length
c 'out_rayy.length', out_rayy.length

for i in [0 .. 100]
    c('cand  :', cand_out_rayy[i])
    c('actual:', out_rayy[i])

#
# stdin.on 'data', (input) ->
#     #c 'input', typeof(input)
#     rayy = input.split('\n')
#     #c 'rayy', rayy
#
#     func_000 rayy
