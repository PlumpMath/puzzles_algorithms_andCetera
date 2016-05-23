c = -> console.log.apply console, arguments


input_000 = "5 6 7\n3 6 10"


input_parse = (strang) ->
    rayy_000 = strang.split('\n')
    rayy_a = rayy_000[0].split(' ')
    rayy_b = rayy_000[1].split(' ')
    return {
        rayy_a: rayy_a
        rayy_b: rayy_b
    }

compare = (rayy_a, rayy_b) ->

    score_a = 0
    score_b = 0
    for idx in [0 .. 2]
        cursor_a = parseInt(rayy_a[idx])
        cursor_b = parseInt(rayy_b[idx])
        if  cursor_a > cursor_b
            score_a++
        else if cursor_a < cursor_b
            score_b++
    return "#{score_a} #{score_b}"





process.stdin.resume()
process.stdin.setEncoding 'ascii'
_input = ''
process.stdin.on 'data', (input)->
    _input += input
process.stdin.on 'end', ->
    rayy = input_parse(_input)
    c compare(rayy.rayy_a, rayy.rayy_b)






# rayy = input_parse(input_000)
#
#
# c compare(rayy.rayy_a, rayy.rayy_b)
