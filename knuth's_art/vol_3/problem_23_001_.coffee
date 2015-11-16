c = -> console.log.apply console, arguments

get_random_int_in_range_002 = (upper_bound)->
    return Math.floor(Math.random() * (upper_bound + 1))

splice_rayy_into_rayy = (target_rayy, target_idx, projectile_rayy)->
    Array.prototype.splice.apply(target_rayy, [target_idx, 0].concat(projectile_rayy))

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


# another perhaps better way to do this is like with the redis
# relations spaces for the social media app, where we have a 
# matrix or 2d array as a cartesian product of the population.
# that space is kind of like what in probability is called the sample space
# here we think of it as the codomain representing the space of possible
# relations.  the image would be the set of relationss active, some subset
# of the space of all possible relations.  if we include the reflexive aspect
# of possible relations (x ~ x), which would be the diagonal in our cartesian 
# matrix, we have 4096 * 4096 == 16,777,216 possible relations.  Knuth says 
# we should get about 200,000 out of the set when each person has approx 100
# relations.  what we actually got initially was ~ 400,000 because we failed to
# eliminate redundant relations.  the way we started to implement the elimination 
# of redundant entries was somewhat convoluted so we want to do it better.
# what we will do is have that cartesian matrix represented as a 2d array
# and then unlike in our redis map for bartr which carried a qualified relationship status vector for each relationship this one will just be a boolean value true for 
# relation and false for no relation.
# so what this means is that for a particular person whilst building up the 
# relations file we should first establish how many relations they will have
# with the random variance function and then check along their column or their 
# row for true values (this should be fast).  we only need one half the diagonal 
# matrix, on the other hand if we wanted to use both diagonals this might assist 
# with searching, something to think about more later.


# so what this means is that in a particular iteration for a particular person
# we first establish what their number of relations should be with our hack 
# random process, (note for later make a nice normal probability distribution 
#aroundd 100 instead of the random variance square shaped as we have) 
# then we go 
#              0 1 2 3 4
#           0  * * * * *
#           1  * * * * *
#           2  * * * * *
#           3  * * * * *
# 
# i would set both.  the set operation is cheap, then we can cycle through 
# either row or column .  so we use the whole matrix
#

# so we could go by i, then we cycle through ith row column by column checking for 
# true,  we push the j values corresponding to true into an already array
# these will be spliced from the fresh population array by that prototype splice
# operation we had used before.


relations_codomain = []

for i in [0 .. 4095]
    relations_codomain[i] = []
    for j in [0 .. 4095]
        relations_codomain[i][j] = false

c relations_codomain[0].length

already_str = ""
for i, idx in relations_codomain

    # check for already related
    already = []
    
    for j, jdx in i
        if j is true
            already.push jdx


    already_str+= " #{already.length}"
    population = [0 .. 4095]
    population.splice idx, 1
    for outcast in already
        population.splice outcast, 1

    # establish number of relations
    variance = get_random_int_in_range_002(30) - 15
    # make the relations from the reduced population pool
    for i in [0 .. (99 + variance)]
        # about 100 relations
        target_idx = get_random_int_in_range_002(population.length - 1)
        target = population[target_idx]
        relations_codomain[idx][target] = true
        relations_codomain[target][idx] = true


# so if that does what we think it should then we should have about 400,000
# total true spots on the matrix, but if we can just traverse the diagonal
# we should just have about 200,000

# question is now, can we make an algorithm which traverses just the diagonal
# this can go by row, for the zeroeth row we traverse from 0 to 4095 (or from 1 better)
# for the 1st row we traverse from 2 to 4095, for the 2nd we traverse from 3 to ...
# 

# custom single use case for this
counter = 0
traverse_matrix_diagonal = ->
    for i in [0 .. 4094]
        for j in [(i + 1) .. 4095]
            if relations_codomain[i][j] is true
                counter++

traverse_matrix_diagonal()

c "counter #{counter}"

counter_2 = 0
traverse_whole_matrix = ->
    for i in [0 .. 4095]
        for j in [0 .. 4095]
            if relations_codomain[i][j] is true
                counter_2++

traverse_whole_matrix()
c "counter_2 #{counter_2}"

c "already_str", already_str













