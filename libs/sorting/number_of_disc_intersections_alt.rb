# This is the solution for Sorting > NumberOfDiscIntersectionsAlt
#
# This is marked as RESPECTABLE difficulty

class NumberOfDiscIntersectionsAlt
  def index_less_than(sortedDiscList, i, start, last)
    mid = start + (last - start) / 2
    case
    when last <= start && sortedDiscList[mid].low_x > i
      mid - 1
    when last <= start
      mid
    when sortedDiscList[mid].low_x > i
      index_less_than(sortedDiscList, i, start, mid - 1)
    else
      index_less_than(sortedDiscList, i, mid + 1, last)
    end
  end

  Disc = Struct.new(:low_x, :high_x)

  def solution(a)
    discs = a.each_with_index.map {|x, i| Disc.new(i - x, i + x)}.sort_by {|ds| ds.low_x}
    total = 0
    for i in 0..discs.length - 1 do
      total += index_less_than(discs, discs[i].high_x + 0.5, 0, discs.length - 1) - i
      if total > 10000000
        total = -1
        break
      end
    end
    total
  end
end


puts NumberOfDiscIntersectionsAlt.new.solution([1, 5, 2, 1, 4, 0])
