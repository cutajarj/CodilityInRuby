# This is the solution for CountingElements > MissingInteger
#
# This is marked as RESPECTABLE difficulty

class MissingInteger
  def solution(a)
    present_markers = Array.new(a.length + 2, false)
    for i in a do
      present_markers[i] = 1 if i > 0 and i <= a.length
    end
    missing_candidate = 1
    while present_markers[missing_candidate] == 1 do
      missing_candidate+=1
    end
    missing_candidate
  end
end

puts MissingInteger.new.solution([1,3,6,4,1,2])
puts MissingInteger.new.solution([1,1,1,9,9,9])
puts MissingInteger.new.solution([1, 2, 3])
puts MissingInteger.new.solution([-1, -3])
puts MissingInteger.new.solution([-1, -3, 1])
puts MissingInteger.new.solution([-1, -3, 3])
