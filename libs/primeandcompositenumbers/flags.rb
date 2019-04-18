# This is the solution for Prime and composite numbers > Flags
#
# This is marked as RESPECTABLE difficulty

class Flags
  def solution(a)
    next_peak = a.length
    peaks = Array.new(a.length, next_peak)
    (a.length - 2).downto(0) do |i|
      next_peak = i if a[i - 1] < a[i] && a[i] > a[i + 1]
      peaks[i] = next_peak
    end

    upper_guess = (Math.sqrt(a.length).floor + 2)
    lower_guess = 0
    while lower_guess < upper_guess - 1
      current_guess = (lower_guess + upper_guess) / 2
      if can_place_flags(peaks, current_guess)
        lower_guess = current_guess
      else
        upper_guess = current_guess
      end
    end

    lower_guess
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

test_trail = Array.new(100000, 0)
for i in 0..test_trail.length - 1
  test_trail[i] += 1 if i % 2 == 1
end

start = Time.now()
puts Flags.new.solution(test_trail)
puts Time.now - start

