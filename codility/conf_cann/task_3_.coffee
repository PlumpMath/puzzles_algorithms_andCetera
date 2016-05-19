c = -> console.log.apply console, arguments

test_data = "
00:01:07,400-234-090\n00:05:01,701-080-080\n00:05:00,400-234-090
"
test_data2 = "
00:05:01,701-080-080\n00:05:00,400-234-090\n00:05:01,301-999-999
"
test_data_3 = "
00:50:00,100-000-000\n00:20:00,100-000-000\n00:50:00,200-000-000\n00:20:00,200-000-000\n00:01:07,300-000-000\n00:06:07,400-000-000
"

solution = (s) ->
    parse_time = (time_str) ->
        rayy = time_str.split ':'
        hours = parseInt rayy[0]
        minutes = parseInt rayy[1]
        seconds = parseInt rayy[2]
        total_seconds = seconds + (60 * minutes) + (3600 * hours)
        return total_seconds

    parse_number = (number_str) ->
        number = parseInt(number_str.split('-').join(''))
        return number

    get_cost = (time) ->
        if time < 300
            cost = time * 3
            return cost
        else
            started = time % 60 > 0
            full = Math.floor(time / 60)
            if started is true
                return (full + 1) * 150
            else
                return full * 150

    total_duration = (calls) ->
        total = 0
        for call in calls
            total = total + call.time
        return total

    remove_highest = (arq) ->
        highest = {leaders: [], time: 0}
        for key, value of arq
            total_time = total_duration value.calls
            if total_time > highest.time
                highest.leaders = [value]
                highest.time = value.time
            else if total_time is highest.time
                highest.leaders.push value
        if highest.leaders.length > 1
            max = {key: null, value: 0}
            for entry in highest.leaders
                if entry.parsed_num > max.value
                    max.value = entry.parsed_num
                    max.key = entry.key
            delete arq[max.key]
        else
            leader = highest.leaders[0]
            delete arq[leader.key]
        return arq

    # main routine body
    rayy = s.split '\n'
    arq = {}
    for item, idx in rayy
        parsed_000 = item.split ','
        time_str = parsed_000[0]
        phone_number_str = parsed_000[1]
        time = parse_time time_str
        cost = get_cost(time)
        parsed_num = parse_number phone_number_str

        if arq[phone_number_str] is undefined
            arq[phone_number_str] =
                key: phone_number_str
                parsed_num: parsed_num
                calls: []
        arq[phone_number_str].calls.push
            time: time
            cost: cost

    arq2 = remove_highest arq
    # c arq2
    # tally finally
    total = 0
    for key, value of arq2
        for call in value.calls
            counter = counter + 1
            total = total + call.cost

    return total

c 'solution: ', solution(test_data_3)
