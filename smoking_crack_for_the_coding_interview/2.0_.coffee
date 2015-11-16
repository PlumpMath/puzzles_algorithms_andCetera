
c = -> console.log.apply console, arguments

class Node
    constructor: (d) ->
        @next = null
        @data = d
    append_to_tail: (d)->
        end = new Node(d)
        n = @
        while (n.next isnt null)
            n = n.next
        n.next = end

delete_node = (head, d)->
    n = head
    if n.data is d
        return head.next
    while n.next isnt null
        if n.next.data is d
            n.next = n.next.next
            return head
        n = n.next

view_list = (head)->
    rayy = []
    n = head
    while (n isnt null)
        if n is undefined then return
        rayy.push n.data
        n = n.next
    return rayy

get_nth_element = (head, n)-> #same as find nth element from 2.2
    if n is 0 then return head
    cursor = head
    for i in [1 .. n]
        cursor = cursor.next
    return cursor

module.exports =
    Node: Node
    delete_node: delete_node
    view_list: view_list
    get_nth_element: get_nth_element
    c: c