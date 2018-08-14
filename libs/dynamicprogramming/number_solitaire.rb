# This is the solution for Dynamic programming > NumberSolitaire
#
# This is marked as RESPECTABLE difficulty
# Note here we have the evolution of the algorithm. Only the last class is the correct one.

class NumberSolitaireRecursive
  def solution(a)
    max_sum_six_distances(a, 0)
  end

  def max_sum_six_distances(a, position)
    if position == a.size - 1
      a[position]
    else
      max_forward = [a.size - 1 - position, 6].min
      current_max = -100000
      for i in 1..max_forward do
        local_max = max_sum_six_distances(a, position + i)
        current_max = [current_max, local_max].max
      end
      current_max + a[position]
    end
  end
end

class NumberSolitaireMemoize
  def solution(a)
    values = Array.new(a.size, -100000)
    max_sum_six_distances(a, 0, values)
  end

  def max_sum_six_distances(a, position, values)
    case
    when position == a.size - 1
      a[position]
    when values[position] == -100000
      max_forward = [a.size - 1 - position, 6].min
      current_max = -100000
      for i in 1..max_forward do
        local_max = max_sum_six_distances(a, position + i, values)
        current_max = [current_max, local_max].max
      end
      result = current_max + a[position]
      values[position] = result
      result
    else
      values[position]
    end
  end
end

class NumberSolitaire
  def solution(a)
    values = Array.new(a.size)
    values[a.size-1] = a[a.size-1]
    for i in (a.size-2).downto(0) do
      values[i] = a[i] + find_max_between(values, i+1, 6)
    end
    values[0]
  end

  def find_max_between(values, start, length)
    max = values[start]
    upto = [start + length - 1, values.size - 1].min
    for i in start..upto
      max = values[i] if values[i] > max
    end
    max
  end
end


puts NumberSolitaireRecursive.new.solution([1, -2, 0, 9, -1, -2, 5, -4])
puts NumberSolitaireRecursive.new.solution([1, -2, 0, 9, -1, -2, 5, -4, -5, -1, -10, -5, -6, -4, -2])
puts NumberSolitaireMemoize.new.solution([1, -2, 0, 9, -1, -2, 5, -4])
puts NumberSolitaireMemoize.new.solution([1, -2, 0, 9, -1, -2, 5, -4, -5, -1, -10, -5, -6, -4, -2])
puts NumberSolitaireMemoize.new.solution([1, -2, 0, 9, -1, -2, 5, -4, -5, -7, -10, -5, -6, -4, -2])
puts NumberSolitaire.new.solution([1, -2, 0, 9, -1, -2, 5, -4])
puts NumberSolitaire.new.solution([1, -2, 0, 9, -1, -2, 5, -4, -5, -1, -10, -5, -6, -4, -2])
puts NumberSolitaire.new.solution([1, -2, 0, 9, -1, -2, 5, -4, -5, -7, -10, -5, -6, -4, -2])
