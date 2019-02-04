# This is the solution for Prefix Sums > Passing Cars
#
# This is marked as PAINLESS difficulty


class PassingCars
  def solution(a)
    suffix_sum = Array.new(a.length + 1, 0)
    (a.length - 1).downto(0) do |i|
      suffix_sum[i] = a[i] + suffix_sum[i + 1]
    end
    count = 0
    0.upto(a.length - 1) do |i|
      count += suffix_sum[i] if a[i] == 0
      if count > 1000000000
        count = -1
        break
      end
    end
    count
  end
end

puts PassingCars.new.solution([0, 1, 0, 1, 1])
