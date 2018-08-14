# This is the solution for Arrays > CyclicRotation
#
# This is marked as PAINLESS difficulty

class CyclicRotation
  def solution(a, k)
    result = Array.new(a.length)
    for i in 0..(a.length - 1) do
      result[(i + k) % a.length] = a[i]
    end
    result
  end
end


puts CyclicRotation.new.solution([3, 8, 9, 7, 6], 3).join(",")

puts CyclicRotation.new.solution([1, 2, 3, 4], 4).join(",")

