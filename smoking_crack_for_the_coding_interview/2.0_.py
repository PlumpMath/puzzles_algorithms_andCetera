# def print_list(head):

c = print
c('hello')
from array import *

class Node:
    def __init__(self, data):
        self.data = data
        self.next = None

    def append_to_tail(self, data):
        end = Node(data)
        n = self
        while n.next != None:
            n = n.next
        n.next = end


def view_list(head):
    rayy = []
    n = head
    while n != None:
        rayy.append(n.data)
        n = n.next
    return rayy

# HackerRank submission:
def append_to_tail(head, data):
    end = Node(data)
    if head == None:
        return end
    else:
        n = head
        while n.next != None:
            n = n.next
        n.next = end
        return head

# HackerRank submission
def append_to_head(head, data):
    new_head = Node(data)
    new_head.next = head
    return new_head

# HackerRank submission
def insert_at_nth(head, data, position):
    insertion = Node(data)
    if position == 0:
        insertion.next = head
        return insertion
    else:
        counter = 0
        node = head
        next = node.next
        while counter < (position - 1):
            node = next
            next = node.next
            counter += 1
        node.next = insertion
        insertion.next = next
        return head

# HackerRank submission
def delete_at_pos(head, position):
    if position == 0:
        return head.next
    elif position == 1:
        head.next = head.next.next
        return head
    else:
        counter = 2
        prev = head.next
        cursor = prev.next
        nextt = cursor.next
        while counter < position:
            counter += 1
            prev = cursor
            cursor = nextt
            if nextt != None:
                nextt = nextt.next
        prev.next = nextt
        return head










# some tests
x = Node(4)

c('x', x, x.data)

x.append_to_tail(8)

y= x.next
c(y.data)



c(view_list(x))
