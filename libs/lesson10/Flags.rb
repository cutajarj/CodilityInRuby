def solution(a)
  peaks = Array.new(a.length, 0)
  total_peaks = 0

  for i in 1..a.length - 2 do
    if a[i - 1] < a[i] && a[i + 1] < a[i]
      peaks[i] = 1
      total_peaks += 1
    end
  end
# THIS CAN BE UPTO Math.sqrt(a.length).ceil + 1 giving a complexity of O(N + n^0.5 log n) == O(N)
# WHY UP TO Math.sqrt(a.length).ceil?
  check_flags_between(1, a.length, 0, peaks)
end

def check_flags_between(start_flag_id, end_flag_id, max_flag_id, peaks)
  if end_flag_id - start_flag_id < 0
    max_flag_id
  else
    last_flag_placed_id = -10000000
    flags_placed = 0
    flag_id = start_flag_id + (end_flag_id - start_flag_id) / 2
    for i in 1..peaks.length - 2 do
      if peaks[i] == 1 && last_flag_placed_id + flag_id <= i && flags_placed < flag_id
        flags_placed += 1
        last_flag_placed_id = i
      end
    end
    if flags_placed == flag_id
      check_flags_between(flag_id + 1, end_flag_id, flag_id, peaks)
    else
      check_flags_between(start_flag_id, flag_id - 1, max_flag_id, peaks)
    end
  end
end


test_trail = Array.new(100000, 0)
for i in 0..test_trail.length - 1
  test_trail[i] += 1 if i % 512 == 1

end

start = Time.now()
puts solution(test_trail)
puts Time.now - start
