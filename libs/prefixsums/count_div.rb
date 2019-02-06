# This is the solution for Prefix Sums > Count Div
#
# This is marked as RESPECTABLE difficulty


class CountDiv
  def solution(a, b, k)
    n_start = (a / k.to_f).ceil
    n_end = (b / k.to_f).floor
    n_end - n_start + 1
  end
end

puts CountDiv.new.solution(6, 11, 2)
