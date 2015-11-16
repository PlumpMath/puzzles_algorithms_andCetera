

{c, rotate_array_000, get_random_rayy, bubble_sort_004, test_order} = require './9.0_.coffee'

c "Given a sorted array of n integers that has been rotated an unknown 
number of times, give an O(log n) algorithm that finds an element in the array
You may assume that the array was originally sorted in increasing order. \n \n "



rayy = [0 .. 33]

rotate_array_000 rayy, 3

c "rayy #{rayy}"



# given a formerly sorted array that has been rotated an unknown number of
# times, find the offset -- rotation number
find_offset_000 = (rayy)->
    cursor = 0
    while cursor < (rayy.length - 1)
        if rayy[cursor] > rayy[cursor + 1]
            c "cursor breaking at cursor/idx:#{cursor}.\n rayy[cursor] #{rayy[cursor]} \n rayy[cursor + 1] #{rayy[cursor + 1]}. \n"
            break
        cursor++
    c "this looks like the offset #{cursor + 1}"
    return cursor + 1


find_rotated_at_idx_000 = (rayy, orig_idx)->
    offset = find_offset_000 rayy
    c "offset #{offset}"
    return rayy[orig_idx + offset]




c find_rotated_at_idx_000 rayy, 2
