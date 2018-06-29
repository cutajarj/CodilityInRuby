def solution(n, a)
  counters = Array.new(n, 0)
  floor = 0
  currentMax = 0
  for i in a do
    x = i - 1
    case
    when i > n
      floor = currentMax
    when counters[x] < floor
      counters[x] = floor + 1
    else
      counters[x] += 1
    end
    currentMax = counters[x] if i <= n && counters[x] > currentMax
  end
  for i in 0..counters.length - 1 do
    counters[i] = floor if counters[i] < floor
  end
  counters
end

puts solution(5, [5]).join(",")