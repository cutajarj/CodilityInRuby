# This is the solution for Prime and composite numbers > Flags
#
# This is marked as RESPECTABLE difficulty

class Flags
  def solution(a)
    peaks = Array.new(a.length, false)
    for i in 1..a.length - 2 do
      peaks[i] = true if a[i - 1] < a[i] && a[i + 1] < a[i]
    end

    upper_guess = (Math.sqrt(a.length).ceil + 1)
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
    current_position = 0
    total_flags = flags_to_place
    while current_position < peaks.length - 1 && total_flags > 0
      if peaks[current_position]
        total_flags -= 1
        current_position += flags_to_place
      else
        current_position += 1
      end
    end
    total_flags == 0
  end

end

test_trail = Array.new(100000, 0)
for i in 0..test_trail.length - 1
  test_trail[i] += 1 if i % 2 == 1
end

start = Time.now()
puts Flags.new.solution(test_trail)
puts Time.now - start

