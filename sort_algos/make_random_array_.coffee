


c = -> console.log.apply console, arguments

# return array of size n, of random unsigned integers between 0 and a thousand
get_random_rayy = (n) ->
    rayy = []
    for i in [0 .. (n - 1)]
        rayy.push Math.floor(Math.random() * 1000)
    return rayy


module.exports = get_random_rayy