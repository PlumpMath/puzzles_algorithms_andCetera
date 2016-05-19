

c = -> console.log.apply console, arguments

solution = (M, A) ->
    N = A.length
    count = new Array(M + 1)
    for i in [0 .. M]
        count[i] = 0
    maxOccurence = 1
    index = -1
    for i in [0 .. (N - 1)]
        if count[A[i]] > 0
            tmp = count[A[i]]
            if (tmp > maxOccurence)
                maxOccurence = tmp
                index = i
            count[A[i]] = tmp + 1
        else
            count[A[i]] = 1
    return A[index]


rayy_000 = [1, 2, 3, 3, 1, 3, 1]

c(solution(3, rayy_000))
