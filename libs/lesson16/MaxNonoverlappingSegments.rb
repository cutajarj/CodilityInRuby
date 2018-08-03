# This is the solution for Greedy algorithms > MaxNonoverlappingSegments
# The problem is equivalent to the Activity Selection Problem,
# where you have to choose the maximum non overlapping tasks.
#
# This is marked as PAINLESS difficulty

class MaxNonoverlappingSegments
  def solution(a, b)
    last_end_segment = -1
    chosen_count = 0
    for i in 0..a.size - 1 do
      if a[i] > last_end_segment
        chosen_count += 1
        last_end_segment = b[i]
      end
    end
    chosen_count
  end
end



puts MaxNonoverlappingSegments.new.solution([1, 3, 7, 9, 1], [5, 6, 8, 9, 10])

puts MaxNonoverlappingSegments.new.solution([1, 3, 5, 7, 9], [2, 4, 6, 8, 10])

puts MaxNonoverlappingSegments.new.solution([], [])
