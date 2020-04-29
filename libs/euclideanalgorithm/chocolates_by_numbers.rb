# This is the solution for Euclidean Algorithm > Chocolate by Numbers
#
# This is marked as PAINLESS difficulty

class ChocolatesByNumbers
  def find_gcd(a, b)
    if b == 0
      a
    else
      find_gcd(b, a % b)
    end
  end

  def solution(n, m)
    n / find_gcd(n, m)
  end
end

puts ChocolatesByNumbers.new.solution(10, 4)

puts ChocolatesByNumbers.new.solution(9, 6)

puts ChocolatesByNumbers.new.solution(10, 11)

