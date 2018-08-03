# This is the solution for CountingElements > MaxCounters
#
# This is marked as RESPECTABLE difficulty

class MaxCounters
  def solution(n, a)
    counters = Array.new(n, 0)
    floor = 0
    current_max = 0
    for i in a do
      x = i - 1
      case
      when i > n
        floor = current_max
      when counters[x] < floor
        counters[x] = floor + 1
      else
        counters[x] += 1
      end
      current_max = counters[x] if i <= n && counters[x] > current_max
    end
    for i in 0..counters.length - 1 do
      counters[i] = floor if counters[i] < floor
    end
    counters
  end
end

puts MaxCounters.new.solution(5, [5]).join(",")