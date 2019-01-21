# This is the solution for Maximum Slice Problem > Max Profit
#
# This is marked as PAINLESS difficulty

class MaxProfit
  def solution(a)
    global_max_sum = 0
    local_max_sum = 0
    for i in 1..a.size - 1
      d = a[i] - a[i - 1]
      local_max_sum = [d, local_max_sum + d].max
      global_max_sum = [local_max_sum, global_max_sum].max
    end
    global_max_sum
  end
end

#                                      -2160,   112,   243,  -353,   354
puts MaxProfit.new.solution([23171, 21011, 21123, 21366, 21013, 21367])
