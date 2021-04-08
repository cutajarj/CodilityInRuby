# This is the solution for Caterpillar Method > MinAbsSumOfTwo
#
# This is marked as RESPECTABLE difficulty

class MinAbsSumOfTwo
  def solution(a)
    min_abs_sum = 2000000000
    a = a.sort
    head = 0
    tail = a.size - 1
    while head <= tail do
      min_abs_sum = [min_abs_sum, (a[head] + a[tail]).abs].min
      if a[head] + a[tail] < 0
        head += 1
      else
        tail -= 1
      end
    end
    min_abs_sum
  end
end

puts MinAbsSumOfTwo.new.solution([-7, 3, -1, 5, -11, 4, -9, 14, 17, -2]) # Solution should be 1
puts MinAbsSumOfTwo.new.solution([8, 3, 5, 16, 11]) # Solution should be 6
puts MinAbsSumOfTwo.new.solution([-7, -5, -6, -2, -9]) # Solution should be 4
puts MinAbsSumOfTwo.new.solution([-7, 3, -6, 1, 0, -9]) # Solution should be 0
puts MinAbsSumOfTwo.new.solution([-22, 3, 4, 5]) # Solution should be 6
