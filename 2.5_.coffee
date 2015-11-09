{Node, delete_node, view_list, get_nth_element, c} = require('./2.0_.coffee')

c "Given a circular linked list, implement an algorithm which returns node at 
the beginning of the loop. \n"

c "Definition: Circular linked list: A (corrupt) linked list in which a node's next pointer points to an eaaarlier node, so as to make a loop in the linked list. \n"

c "Example: Input: A -> B -> C -> D -> E -> C (the same C as earlier)" 
c "Output: C \n"


x = new Node(3) ; x.append_to_tail(4) ; x.append_to_tail(5)
x.append_to_tail(6)

get_last_element = (l)->
    while l.next isnt null
        l = l.next
    return l

c 'x', view_list(x)
y = x.next
c 'y', view_list(y)

z = get_last_element(x)
# c 'z', view_list(z) # infinite loop
# c 'z', z # also infinite loop

z.next = y

c 'now x',view_list(x)

have = true
z = x
i = 0
while have
    if (z.next isnt null) and (i < 12)
        c z.data
        z = z.next
        i++
        c z
        c i
    else
        have = false