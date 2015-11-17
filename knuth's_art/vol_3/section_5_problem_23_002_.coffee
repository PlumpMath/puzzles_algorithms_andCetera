c = -> console.log.apply console, arguments

c "\n In a certain group of 4096 people, everyone has about 100 acquaintances.  
A file has been prepared list all pairs of people who are acquaintances.
(The relation is symmetric: If x is acquainted with y, then y is acquainted
with x. Therefore the file contains roughly 200,000 entries). \n
How would you design an algorithm to list all the k-person cliques in 
this group of people, given k ? 
\n (A clique is an instance of mutual
acquaintances. Everyone in the clique is acquainted with everyone else.) 
\n Assume that there are no cliques of size 25 (or greater), so the total 
number of cliques cannot be enormous.
\n
"

c3 = (a)-> process.stdout.write a

splice_rayy_into_rayy = (target_rayy, target_idx, projectile_rayy)->
    Array.prototype.splice.apply(target_rayy, [target_idx, 0].concat(projectile_rayy))

get_random_int_in_range_002 = (upper_bound)->
    return Math.floor(Math.random() * (upper_bound + 1))

clone_rayy = (rayy)->
    clone = []
    for i, idx in rayy
        clone[idx] = i
    return clone

build_relations_codomain = ->
    relations_codomain = []

    for i in [0 .. 4095]
        relations_codomain[i] = []
        for j in [0 .. 4095]
            relations_codomain[i][j] = false

    already_str = ""
    for i, idx in relations_codomain
        already = []
        for j, jdx in i
            if j is true
                already.push jdx
        # already_str+= " #{already.length}"
        population = [0 .. 4095]
        population.splice idx, 1
        for outcast in already
            population.splice outcast, 1
        # establish number of relations
        # TODO make the variance a normal distribution instead of this square bloc
        variance = get_random_int_in_range_002(30) - 15
        # make the relations from the reduced population pool
        roll = 99 + variance
        diff = roll - already.length
        # if ((99 + variance) - already.length) > 0
        if diff > 0
            for i in [0 .. diff]
                # about 100 relations total
                target_idx = get_random_int_in_range_002(population.length - 1)
                target = population[target_idx]
                relations_codomain[idx][target] = true
                relations_codomain[target][idx] = true

    return relations_codomain


get_list_of_binary_relations_from_relations_codomain = (relations_codomain)->
    relations_list = []
    for i in [0 .. 4094]
        for j in [(i + 1) .. 4095]
            if relations_codomain[i][j] is true
                relations_list.push [i, j]
    return relations_list

clique_directory = (clique_rayy)->
    directory = []
    for relation in clique_rayy
        if directory.indexOf(relation[0]) is -1
            directory.push relation[0]
        if directory.indexOf(relation[1]) is -1
            directory.push relation[1]
    return directory

get_plus_k_cliques = (directory, relations_codomain)->

    rayys_have_set_equality = (rayy_a, rayy_b)->
        #assumes equal num of elements
        for i, idx in rayy_a
            if rayy_b.indexOf(i) is -1
                return false
        return true

    collection_has_rayy = (collection, rayy_b)->
        for rayy_a in collection
            if rayys_have_set_equality rayy_a, rayy_b
                return true
        return false

    is_related_to_whole_directory = (target) ->
        for number in directory
            if relations_codomain[target][number] is false
                return false
        return true

    plus_k_cliques = []
    new_seeds = []

    # for each subject member
    for subject, subject_idx in directory
        for object, object_idx in relations_codomain[subject_idx]
            # find all their relations
            if (object is true) and (directory.indexOf(object_idx) is -1)
                if is_related_to_whole_directory(object_idx)
                    new_seeds.push object_idx

    for member in new_seeds
        up_dir = clone_rayy directory
        up_dir.push member
        if not(collection_has_rayy(plus_k_cliques, up_dir))
            plus_k_cliques.push up_dir

    return plus_k_cliques



relations_codomain = build_relations_codomain()

c relations_codomain.length


binary_relations_list = get_list_of_binary_relations_from_relations_codomain relations_codomain

c binary_relations_list.length

twos = []

for relation in binary_relations_list
    directory = clique_directory [relation]
    twos.push directory

c twos.length

# c 'twos', twos



# rayy = []
# for i in [0 .. 10]
#     x = two_cliques_as_directories[i]
#     c x
#     deer = get_plus_k_cliques x, relations_codomain
#     c deer
#     splice_rayy_into_rayy rayy, rayy.length, deer

# c 'rayy', rayy

threes = []
for directory in twos
    three = get_plus_k_cliques directory, relations_codomain
    splice_rayy_into_rayy threes, threes.length, three

c "threes.length #{threes.length}"


fours = []
for directory in threes
    four = get_plus_k_cliques directory, relations_codomain
    splice_rayy_into_rayy fours, fours.length, four

c "fours.length #{fours.length}"

fives = []
for directory in fours
    five = get_plus_k_cliques directory, relations_codomain
    splice_rayy_into_rayy fives, fives.length, five

c "fives.length #{fives.length}"

sixes = []
for directory in fives
    six = get_plus_k_cliques directory, relations_codomain
    splice_rayy_into_rayy sixes, sixes.length, six

c "sixes.length #{sixes.length}"

sevens = []
for directory in sixes
    seven = get_plus_k_cliques directory, relations_codomain
    splice_rayy_into_rayy sevens, sevens.length, seven

c "sevens.length #{sevens.length}"

eights = []
for directory in sevens
    eight = get_plus_k_cliques directory, relations_codomain
    splice_rayy_into_rayy eights, eights.length, eight

c "eights.length #{eights.length}"

nines = []
for directory in eights
    nine = get_plus_k_cliques directory, relations_codomain
    splice_rayy_into_rayy nines, nines,length, nine

c "nines.length #{nines.length}"






