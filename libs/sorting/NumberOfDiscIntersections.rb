# This is the solution for Sorting > NumberOfDiscIntersections
#
# This is marked as RESPECTABLE difficulty

class NumberOfDiscIntersections
  def index_less_than(sortedDiskList, i, start, last)
    mid = start + (last - start) / 2
    case
    when last <= start && sortedDiskList[mid].low_x > i
      mid - 1
    when last <= start
      mid
    when sortedDiskList[mid].low_x > i
      index_less_than(sortedDiskList, i, start, mid - 1)
    else
      index_less_than(sortedDiskList, i, mid + 1, last)
    end
  end

  Disk = Struct.new(:low_x, :high_x)

  def solution(a)
    disks = a.each_with_index.map {|x, i| Disk.new(i - x, i + x)}.sort_by {|ds| ds.low_x}
    total = 0
    for i in 0..disks.length - 1 do
      total += index_less_than(disks, disks[i].high_x + 0.5, 0, disks.length - 1) - i
      if total > 10000000
        total = -1
        break
      end
    end
    total
  end
end


puts NumberOfDiscIntersections.new.solution([1, 5, 2, 1, 4, 0])
