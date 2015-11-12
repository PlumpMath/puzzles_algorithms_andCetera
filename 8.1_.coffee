




c = -> console.log.apply console, arguments


c "Write a method to generate the nth Fibonacci number. \n Why recursive ?"



fibonacci_of = (n)->

    if n is 0
        return 0
    else if n is 1
        return 1
    else
        return arguments.callee(n - 1) + arguments.callee(n - 2)


for i in [0 .. 33]
    c "fibonacci of #{i} is #{fibonacci_of(i)}"


