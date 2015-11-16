c = -> console.log.apply console, arguments

c "Implement an algorithm to delete a node in the middle of a single linked list, given only access to that node. "
# this is simpler than the delete_node in 2.0 because we don't have to search
# for it; it's given.

{Node, delete_node, view_list, get_nth_element} = require('./2.0_.coffee')

x = new Node(3)
x.append_to_tail 4
x.append_to_tail 5
x.append_to_tail 4
x.append_to_tail 7
x.append_to_tail 4
x.append_to_tail 7
x.append_to_tail 6
x.append_to_tail 8


c view_list(x)


del_node = (node)->
    if node is null or node.next is null
        return false
    next = node.next
    node.data = next.data
    node.next = next.next
    return true

y = get_nth_element x, 3

c 'y', view_list(y)

del_node y

c 'now x', view_list(x)







