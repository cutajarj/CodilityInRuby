# This is the solution for Caterpillar Method > CountDistinctSlices
#
# This is marked as PAINLESS difficulty

class TieRopes
  def solution(k, a)
    count = 0
    rope_length = 0
    for rope in a do
      rope_length += rope
      if rope_length >= k
        count += 1
        rope_length = 0
      end
    end
    count
  end
end

puts TieRopes.new.solution(4, [1, 2, 3, 4, 1, 1, 3])
