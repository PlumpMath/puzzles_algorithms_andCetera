


{c, get_random_rayy, bubble_sort_004, test_order} = require './9.0_.coffee'



c "You are given two sorted arrays, A and B, and A has a large enough buffer at the end to hold B. Write a method to merge B into A in sorted order."


A_clust = get_random_rayy 11

B_clust = get_random_rayy 17

A = bubble_sort_004(A_clust)

B = bubble_sort_004(B_clust)

c "\n"
c "A #{A.toString()}"
c "B #{B.toString()}"
c "\n"

sort_merge_000 = (a, b)->



    # so we start with the first element in A , call that cursor_000
    # now we want to find all elements in B that are less than cursor_000, and insert them into the array
    # then we have a well-known problem from the point of iterating over the array in that we've mutating something 
    #that we are in the process of iterating through. 
    # ignoring the problem though we go onto the next element in A. we find all the elements in the sorted B 
    # minus the elements we took out of B to insert into that last one that can be inserted before this next element
    # and so on.  
    # we'll need to track the 'next' index in A.  that could be a simple way of doing this.
    # like if we are on the first element in A and we put 4 elements from B before the first element in A
    # now the second element that's really from A un-edited isn't 1 it's 1 + 4 = 5.  
    # so that's how we keep track of original A.  with the next pointer variable.
    # we need to do something similar with B, track the unordered witha  next pointer.  of course
    # if we're mutating B as we go we don't need to worry about this, we can just start from the 
    # beginning of B everytime without needing to worry about anything.
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



