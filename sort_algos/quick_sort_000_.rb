

def get_random_rayy(n)
    rayy = []
    0.upto(n - 1) {
        num = (rand * 1000).floor
        rayy.insert(-1, num)
    }
    return rayy
end

def quick_sort(rayy)
    len = rayy.length
    if len == 1 or len == 0
        return rayy
    end
    random_idx = (rand * len).floor
    apple = [rayy.delete_at(random_idx)]
    pivot = apple[0]
    # p "apple #{apple}, rayy #{rayy}"
    less = []
    more = []
    # p "pivot #{pivot}, apple #{apple} rayy #{rayy}"
    rayy.each { |i|
        if i < pivot
            less.push i
        end
        if i >= pivot
            more.push i
        end
    }
    less_sorted = quick_sort(less)
    more_sorted = quick_sort(more)
    return less_sorted + apple + more_sorted

end



rayy = get_random_rayy(45)

p "rayy: #{rayy}"
puts "\n"
p quick_sort(rayy)

