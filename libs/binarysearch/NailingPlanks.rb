# This is the solution for Binary Search > Nailing Planks
#
# This is marked as RESPECTABLE difficulty

class NailingPlanks
  def solution(a, b, c)
    start = 0
    finish = c.size - 1
    upto = -2
    while start <= finish do
      mid = (start + finish) / 2
      if check_if_all_nailed(a,b, c, mid)
        upto = mid
        finish = mid - 1
      else
        start = mid + 1
      end
    end
    upto + 1
  end

  def check_if_all_nailed(plank_start, plank_end, nails, upto)
    sorted_nails = nails[0, upto + 1].sort
    all_nailed = true
    for i in 0..plank_start.size - 1 do
      unless binary_search(plank_start[i], plank_end[i], sorted_nails)
        all_nailed = false
        break
      end
    end
    all_nailed
  end

  def binary_search(min, max, nails_sorted)
    start = 0
    finish = nails_sorted.size - 1
    found = false
    while start <= finish do
      mid = (start + finish) / 2
      nail_pos = nails_sorted[mid]
      case
      when max < nail_pos
        finish = mid - 1
      when min > nail_pos
        start = mid + 1
      else
        found = true
        break
      end
    end
    found
  end
end

puts NailingPlanks.new.solution([1, 4, 5, 8, 11],
                                           [4, 5, 9, 10, 12],
                                           [4, 6, 7, 10, 2, 12, 8, 9])
