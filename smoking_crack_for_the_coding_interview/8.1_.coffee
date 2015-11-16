




c = -> console.log.apply console, arguments


c "Write a method to generate the nth Fibonacci number. \n Why recursive ?"

# an iterative version for better memory usage characteristics
fibonacci_of_001 = (n)->
    k_a = 0
    k_b = 1
    cursor = null
    if n is 0
        return 0
    if n is 1
        return 1
    for k in [2 .. n]
        cursor = k_a + k_b
        k_a = k_b
        k_b = cursor
        # c "cursor #{cursor}"
    # c "end cursor #{cursor} for n #{n}"
    return cursor


# recursive version 
fibonacci_of = (n)->

    if n is 0
        return 0
    else if n is 1
        return 1
    else
        return arguments.callee(n - 1) + arguments.callee(n - 2)


for i in [0 .. 20]
    c "fibonacci of #{i} is #{fibonacci_of_001(i)}"


