# This is the solution for Stacks And Queues > Brackets
#
# This is marked as PAINLESS difficulty


class Brackets
  def solution(s)
    valid = true
    stack = []
    s.each_char do |c|
      case
      when c == "[" || c == "(" || c == "{"
        stack.push(c)
      when c == ")"
        left = stack.pop
        valid = false if left != "("
      when c == "]"
        left = stack.pop
        valid = false if left != "["
      when c == "}"
        left = stack.pop
        valid = false if left != "{"
      end
    end
    valid && stack.empty? ? 1 : 0
  end
end

puts Brackets.new.solution("()[]{}()[]{}")

puts Brackets.new.solution("()]]")
