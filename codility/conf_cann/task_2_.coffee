
c = -> console.log.apply console, arguments

S_000 = "00-44   48 5555 8361"
expected_000 = "004-448-555-583-61"

S_001 = "0 -         22 1985--324"
expected_001 = "022-198-53-24"

S_002 = "12  28"
expected_002 = "12-28"

solution = (s)->
    c = -> console.log.apply console, arguments
    # erase all dashes and spaces
    pass_one = (s) ->
        idx = 0
        while idx < s.length
            if (s[idx] is ' ') or (s[idx] is '-')
                s.splice(idx, 1)
                arguments.callee s
            idx = idx + 1
        return s

    mod_clean = (rayy, acc) ->
        # in this case just size 3 blocks all the way
        first_block = rayy.splice(-3, 3)
        acc.splice 0, 0, first_block
        if rayy.length isnt 0
            arguments.callee rayy, acc
        else
            return acc

    block_2 = (rayy) ->
        last_block = rayy.splice(-2, 2)
        former = mod_clean rayy, []
        final = former.concat [last_block]
        # c 'final', final
        final2 = for ir in final
            ir.join('')
        final3 = final2.join('-')
        return final3

    block_1 = (rayy) ->
        last_block = rayy.splice(-2, 2)
        second_to_last_block = rayy.splice(-2, 2)
        former = mod_clean rayy, []
        # c 'former', former

        # cursor_0 = former.concat [second_to_last_block]
        if former[0].length > 0
            cursor_0 = former.concat [second_to_last_block]
        else
            cursor_0 = [second_to_last_block]
        cursor_1 = cursor_0.concat [last_block]
        final = for ir in cursor_1
            ir.join ''
        final2 = final.join '-'
        return final2

    block_0 = (rayy) ->
        former = mod_clean rayy, []
        final = for ir in former
            ir.join ''
        return final.join('-')

    rayy_000 = s.split ''
    rayy_001 = pass_one rayy_000
    mod = rayy_001.length % 3
    switch mod
        when 2
            # need one block of size = 2 at the end
            return block_2 rayy_001
        when 1
            return block_1 rayy_001
            # need two blocks of size = 2 at the end
        when 0
            return block_0 rayy_001

solution_000 = solution S_000
c 'solution_000', solution_000

solution_001 = solution S_001
c 'solution_001', solution_001

c solution "555372654"
c solution "0 - 22 1985--324"

solution_002 = solution S_002
c 'solution_001', solution_002
