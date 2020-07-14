class PermMissingElem
  def solution(a)
    max_number = a.size + 1
    actual_sum = 0
    for number in a do
      actual_sum += number
    end
    expected_sum = (max_number * (max_number + 1) / 2)
    expected_sum - actual_sum
  end
end


puts PermMissingElem.new.solution([2, 3, 1, 5])
puts PermMissingElem.new.solution([1, 2, 3, 4, 5, 6, 7, 8, 9])
puts PermMissingElem.new.solution([])
