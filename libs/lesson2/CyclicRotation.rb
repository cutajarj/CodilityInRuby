def solution(a, k)
	result = Array.new(a.length)
	for i in 0..(a.length-1) do 
		result[(i + k) % a.length] = a[i]
	end
	result
end

puts solution([3, 8, 9, 7, 6], 3).join(",")

puts solution([1, 2, 3, 4], 4).join(",")
