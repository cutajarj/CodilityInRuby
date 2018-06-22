def solution(a)
	consecutive_size = 0
	candidate = 0
	for item in a do
		case 
		when consecutive_size == 0
			candidate = item
			consecutive_size += 1
		when candidate == item
			consecutive_size += 1
		else
			consecutive_size -= 1
		end
	end
	occurance = a.inject(0){|sum, x| sum + if x == candidate then 1 else 0 end}
	if occurance > (a.length/2) then a.find_index(candidate) else -1 end
end

puts solution([3,0,1,1,4,1,1])
