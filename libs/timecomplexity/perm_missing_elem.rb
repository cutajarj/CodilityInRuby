class PermMissingElem
  def solution(a)
    max_number = a.size + 1
    sum = 0
    for number in a do
      sum += number
    end
    (max_number * (max_number + 1) / 2) - sum
  end
end


puts PermMissingElem.new.solution([2, 3, 1, 5])
