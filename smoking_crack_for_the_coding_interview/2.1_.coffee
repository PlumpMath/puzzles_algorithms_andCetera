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


c view_list x

# this solution illumines/illustrates the pass by reference feature of the 
# language.  on the first pass for sure nothing is in rayy, which means
# the else call is called at least on that first pass.  what happens there
# is that previous is set pointing to the same memory address as head
# but then after that head is pointed to a different address.  so it's kind 
# of like head and head.next are there so previous.next = head.next is 
# equivalent to saying head.next = head.next.next.  but the juggling may require
# the prev pointer.  
remove_duplicates_000 = (head)->
    rayy = []
    previous = {} # we set up this cursor
    while head isnt null
        c '0000 previous', view_list(previous), 'head', view_list(head)
        if rayy.indexOf(head.data) isnt -1
            # at this head points to the same thing as previous.next
            # so this is like saying head = head.next , so we just
            # skipped over the duplicate because its entry was found in 
            # rayy
            previous.next = head.next # == head.next = head.next.next
        else
            rayy.push head.data
            previous = head
        c '1111 previous', view_list(previous), 'head', view_list(head), "\n"
        head = head.next
    # That's really cool.  I get it.







# double nested while loops like the shunting algorithm.
remove_duplicates_001_c = (head)->
    if head is null then return
    previous = head
    current = previous.next
    while current isnt null
        runner = head # now previous and runner both point to same addrs as head
        c "in the first/outer while loop before any new assignments: head: #{view_list(head)}, previous: #{view_list(previous)}, current/previous.next: #{view_list(current)}, runner(set to head): #{} \n \n" # runner is not changed from head , but head itself is changing
        while runner isnt current # but we're going to cycle runner until its value at address is same as val at address of current ; carefull though, that value isn't a data, it's a whole linked list
            if runner.data is current.data
                tmp = current.next
                previous.next = tmp
                current = tmp
                break
            runner = runner.next
        if runner is current
            previous = current
            current = current.next

# double nested while loops like the shunting algorithm.
remove_duplicates_001 = (head)->
    if head is null then return
    previous = head
    current = previous.next
    while current isnt null
        c "current: #{view_list(current)}"
        runner = head
        while runner isnt current
            c "runner isnt current"
            if runner.data is current.data
                tmp = current.next
                previous.next = tmp
                c "changing current 0"
                current = tmp
                break
            runner = runner.next
        if runner is current
            c "runner is current: changing current 1"
            previous = current

            current = current.next

remove_duplicates_001 x

c 'now x', view_list(x)


y = {}
y.au = 34



