# This is the solution for Caterpillar Method > CountDistinctSlices
#
# This is marked as PAINLESS difficulty

class CountDistinctSlices
  def solution(m, a)
    total_slices = 0
    in_current_slice = Array.new(m, false)
    head = 0
    for tail in 0..a.size - 1 do
      new_slice = false
      while head < a.size && !in_current_slice[a[head]] do
        in_current_slice[a[head]] = true
        head += 1
        total_slices += (head - tail)
        total_slices = 1000000000 if total_slices > 1000000000
      end
      in_current_slice[a[tail]] = false
    end
    total_slices
  end
end

puts CountDistinctSlices.new.solution(6, [3, 4, 5, 5, 2])

puts CountDistinctSlices.new.solution(6, [3, 5, 4, 5, 2])

puts CountDistinctSlices.new.solution(6, [5, 3, 4, 2, 5])

puts CountDistinctSlices.new.solution(6, [5, 5, 5, 4, 5])

puts CountDistinctSlices.new.solution(6, [5])