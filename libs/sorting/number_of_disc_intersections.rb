# This is the solution for Sorting > NumberOfDiscIntersectionsAlt
#
# This is marked as RESPECTABLE difficulty

class NumberOfDiscIntersections
  Disc = Struct.new(:x, :start_end)

  def solution(a)
    disc_history = Array.new(a.length * 2)
    j = 0
    for i in 0..a.length - 1 do
      disc_history[j] = Disc.new(i - a[i], 1)
      disc_history[j + 1] = Disc.new(i + a[i], -1)
      j += 2
    end
    #disc_history = disc_history.sort_by{|a| [a.x, - a.start_end]} #This is slow
    disc_history = disc_history.sort_by{|a| a.x * 10 - a.start_end}
    intersections = 0
    active_intersections = 0
    for log in disc_history do
      active_intersections += log.start_end
      intersections += active_intersections - 1 if log.start_end > 0
      if intersections > 10000000
        intersections = -1
        break
      end
    end
    intersections
  end
end

puts NumberOfDiscIntersections.new.solution([1, 5, 2, 1, 4, 0])
