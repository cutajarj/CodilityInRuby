def solution(a)
  sum_left = a[0]
  sum_right = a.inject(0) {|sum, x| sum + x} - a[0]
  diff = (sum_left - sum_right).abs
  for i in (1..a.length - 2) do
    sum_left += a[i]
    sum_right -= a[i]
    current_diff = (sum_left - sum_right).abs
    diff = current_diff if (diff > current_diff)
  end
  diff
end

puts solution([3, 1, 2, 4, 3])
