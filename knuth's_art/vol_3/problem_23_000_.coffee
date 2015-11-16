c = -> console.log.apply console, arguments

c3 = (a)-> process.stdout.write a

# c "\n In a certain group of 4096 people, everyone has about 100 acquaintances.  
# A file has been prepared list all pairs of people who are acquaintances.
# (The relation is symmetric: If x is acquainted with y, then y is acquainted
# with x. Therefore the file contains roughly 200,000 entries). \n
# How would you design an algorithm to list all the k-person cliques in 
# this group of people, given k ? 
# \n (A clique is an instance of mutual
# acquaintances. Everyone in the clique is acquainted with everyone else.) 
# \n Assume that there are no cliques of size 25 (or greater), so the total 
# number of cliques cannot be enormous.
# \n
# "

# this so called file could be expressed in coffeescript as an array.
# an array of arrays.  each array contains two numbers.  numbers can 
# in the set interval from 0 to 4095.

# we have all the two person cliques in our array of arrays enumerating
# relationships.

# how do we formalise a 3 person clique ?
# there should be one symmetric relation for each unordered pair
# maybe this is like the binomial coefficient.  number of combinations
# unordered permutations.  

# say we have people a, b, c
# (a, b) , (a , c) , (b , c)

clone_rayy_000 = (rayy)->
    clone = []
    for i, idx in rayy
        clone[idx] = i
    return clone


factorial = (n)->
    result = n
    while n > 1
        n--
        result*= n
    return result


n_choose_k = (n, k) ->
    return factorial(n) / ( factorial(k) * factorial(n - k) )


c n_choose_k(4, 2)

c n_choose_k(3, 2)


get_random_int_in_range_002 = (upper_bound)->
    return Math.floor(Math.random() * (upper_bound + 1))

people = [0 .. 4095]

relations = []

# given a person and a phone book, look up all the people they 
# are already related to and remove those from the phone_book
# which is to be returned
remove_alreadies = (person, phone_book)->
    book_clone = clone_rayy_000 phone_book
    for number in phone_book
        for relation in relations
            if (relation[0] is number) and (relation[1] is person)
                book_clone.splice


# make approx 100 relations randomly for a given person 
make_relations_randomly = (person)->
    phone_book = [0 .. 4095]
    phone_book.splice(person, 1)
    # we also need to remove all relations already containing this person

    variance = (get_random_int_in_range_002(30) - 15)
    for j in [0 .. (100 + variance)]
        card_phone_book = phone_book.length
        number = get_random_int_in_range_002(card_phone_book - 1)
        relation = [person, phone_book[number]]
        relations.push relation
        phone_book.splice(number, 1)

test_make_relations_randomly = ->
    relations = []
    person = get_random_int_in_range_002 4095
    c "person #{person}"
    make_relations_randomly person

    # check no duplicates
    already = []
    for relation, idx in relations
        if already.indexOf(relation[1]) is -1
            already.push relation[1]
        else
            c "BANG bang error"
    c "already.length #{already.length}"


    # c relations
    c relations.length

# test_make_relations_randomly()

for person in people
    make_relations_randomly person

c "relations.length", relations.length





