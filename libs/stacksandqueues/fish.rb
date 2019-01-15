# This is the solution for Stacks And Queues > Fish
#
# This is marked as PAINLESS difficulty

class Fish
  def solution(a, b)
    stack = []
    survivors = 0
    for i in 0..a.length - 1 do
      weight = a[i]
      if b[i] == 1
        stack.push(weight)
      else
        weightdown = stack.pop
        while !weightdown.nil? && weightdown < weight
          weightdown = stack.pop
        end
        if weightdown.nil?
          survivors += 1
        else
          stack.push(weightdown)
        end
      end
    end
    survivors + stack.length
  end
end

puts Fish.new.solution([4, 8, 2, 6, 7], [0, 1, 1, 0, 0])
