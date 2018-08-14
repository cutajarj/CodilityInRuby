# This is the solution for CountingElements > MaxCounters
#
# This is marked as RESPECTABLE difficulty

class MaxCounters
  def solution(n, a)
    counters = Array.new(n, 0)
    start_line = 0
    current_max = 0
    for i in a do
      x = i - 1
      case
      when i > n
        start_line = current_max
      when counters[x] < start_line
        counters[x] = start_line + 1
      else
        counters[x] += 1
      end
      current_max = counters[x] if i <= n && counters[x] > current_max
    end
    for i in 0..counters.length - 1 do
      counters[i] = start_line if counters[i] < start_line
    end
    counters
  end
end

puts MaxCounters.new.solution(5, [3, 4, 4, 6, 1, 4, 4]).join(",")
