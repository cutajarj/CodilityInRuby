# This is the solution for Prime and composite numbers > Flags
#
# This is marked as RESPECTABLE difficulty

class Flags
  def solution(a)
    next_peak = a.length
    peaks = Array.new(a.length)
    peaks[a.length - 1] = next_peak
    (a.length - 2).downto(0) do |i|
      next_peak = i if a[i - 1] < a[i] && a[i] > a[i + 1]
      peaks[i] = next_peak
    end
    peaks[0] = next_peak

    current_guess = 0
    next_guess = 0
    while can_place_flags(peaks, next_guess)
      current_guess = next_guess
      next_guess += 1
    end

    current_guess
  end

  def can_place_flags(peaks, flags_to_place)
    current_position = 1 - flags_to_place
    for i in 0..flags_to_place - 1 do
      if current_position + flags_to_place > peaks.length - 1
        return false
      end
      current_position = peaks[current_position + flags_to_place]
    end
    current_position < peaks.length
  end

end

test_trail = [1,5,3,4,3,4,1,2,3,4,6,2]
puts Flags.new.solution(test_trail)


