

{Node, delete_node, view_list, get_nth_element, c} = require('./2.0_.coffee')

c "You have two numbers represented by a linked list, where each node contains a 
single digit. The digits are sntored in reverse order such taht the 1's digit 
is at th ehead of the list  Write a function that adds the two numbers and returns 
the sum as a linked list"

x = new Node(3) ; x.append_to_tail(1) ; x.append_to_tail(5)
y = new Node(5) ; y.append_to_tail(9) ; y.append_to_tail(2)

c x
c y

c view_list(x)
c view_list(y)

# have = true
# carry = off
# while have
#     x_cursor = x.data
#     y_cursor = y.data
#     z = x_cursor + y_cursor
#     c 'z', z
#     if carry
#         c 'carry is '
#         z += 1
#         c 'now z', z
#     if z > 9
#         z = z - 10
#         c 'z', z
#         carry = on
#     else
#         carry = off
#     x = x.next
#     y = y.next
#     c 'z finally::::::::::::::::::::::', z
#     if x is null
#         have = false

add_by_digits = (a, b)->
    ans = new Node(0)
    have_digits = true
    carry = off
    while have_digits
        if x is null
            x_cursor = 0
        else
            x_cursor = x.data
        if y is null
            y_cursor = 0
        else
            y_cursor = y.data
        z = x_cursor + y_cursor
        if carry
            z += 1
        if z > 9
            z = z - 10
            carry = on
        else
            carry = off
        # c 'x.next', x
        # c 'y.next', y
        ans.append_to_tail z
        x = x.next ; y = y.next
        if x is null and y is null
            # c 'have digits set to false'
            have_digits = false

    ans = ans.next

    return ans

test = add_by_digits x, y

c 'test', view_list(test)