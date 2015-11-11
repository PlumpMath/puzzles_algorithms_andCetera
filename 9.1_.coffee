


{c, get_random_rayy, bubble_sort_004, test_order} = require './9.0_.coffee'



c "You are given two sorted arrays, A and B, and A has a large enough buffer at
 the end to hold B. Write a method to merge B into A in sorted order."




A_clust = get_random_rayy 11

B_clust = get_random_rayy 17

A = bubble_sort_004(A_clust)

B = bubble_sort_004(B_clust)

c "\n"
c "A #{A.toString()}"
c "B #{B.toString()}"
c "\n"

sort_merge_000 = (a, b)->
    a_idx = 0
    a_next = 1 # pointer
    while (a_idx < (a.length - 1))
        c "a_idx #{a_idx}"
        cursor = a[a_idx]
        # now find all elements of b that are less than cursor
        b_idx = -1
        while (b_idx < (b.length - 1))
            c "orig b_idx #{b_idx}"
            if b[b_idx] > cursor
                c "breaking with b_idx at #{b_idx}"
                break
            else
                b_idx++
        if b_idx > -1
            tab_rayy = b.splice 0, b_idx
            c "tab_rayy #{tab_rayy}"
            c "and b #{b}"
            Array.prototype.splice.apply(a, [a_idx, 0].concat(tab_rayy))
            a_idx += (b_idx + 1)
        else
            a_idx++
    return a




x = sort_merge_000(A, B)
c("\n", x.toString() )

c "test order is good ? #{test_order(x)}"



