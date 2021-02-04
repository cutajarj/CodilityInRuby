# This is the solution for CountingElements > FrogRiverOne
#
# This is marked as PAINLESS difficulty

class FrogRiverOne
  def solution(x, a)
    river_positions = Array.new(x + 1, false)
    for time in 0..a.length - 1 do
      pos = a[time]
      if !river_positions[pos]
        river_positions[pos] = true
        x -= 1
        return time if x == 0
      end
    end
    return -1
  end
end

puts FrogRiverOne.new.solution(5, [1, 3, 1, 4, 2, 3, 5, 4])

puts FrogRiverOne.new.solution(1, [1, 1, 1])

puts FrogRiverOne.new.solution(3, [1, 2, 1])
