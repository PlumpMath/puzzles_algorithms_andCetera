c = -> console.log.apply console, arguments

c 'reverse a string'

make_random_string = require('./make_random_string_.coffee')

x = make_random_string 7, true

c 'x', x

rayy = x.split ''
reversed = ""
for i in [0 .. (rayy.length - 1)]
    y = rayy.length - 1
    reversed += rayy[y - i]

c 'reversed', reversed






