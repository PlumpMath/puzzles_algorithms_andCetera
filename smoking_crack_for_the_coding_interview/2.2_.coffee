c = -> console.log.apply console, arguments

{Node, delete_node, view_list} = require('./2.0_.coffee')

x = new Node(3)
x.append_to_tail 4
x.append_to_tail 5
x.append_to_tail 4
x.append_to_tail 7
x.append_to_tail 4
x.append_to_tail 7
x.append_to_tail 6
x.append_to_tail 8

c "2.2: Implement an algorithm to find the nth to last element of a singly linked list."


find_nth_element = (head, n)->
    if n is 0 then return head
    cursor = head
    for i in [1 .. n]
        cursor = cursor.next
    return cursor


find_nth_to_last__cursive_000 = (head, n)->
    c 'head', head
    y = find_nth_element(head, n)
    c 'y', y
    if y.next isnt null
        # c 'head', head
        return arguments.callee(head.next, n)
    else
        return head



z = find_nth_to_last__cursive_000(x, 4)

c(view_list(z))

c view_list(x) ; c "\n"




# c view_list(find_nth_element(x, 0))
# c view_list(find_nth_element(x, 1))
# c view_list(find_nth_element(x, 2))
# c view_list(find_nth_element(x, 3))
# c view_list(find_nth_element(x, 4))







