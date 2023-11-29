# @param {String} s
# @return {Boolean}
def is_valid(s)
  stack = []
  s.chars.each do |c|
    if c == "(" || c == "{" || c == "["
      stack << c
    else
      open = stack.pop
      unless (open == '(' && c == ')') || (open == '{' && c == '}') || (open == '[' && c == ']')
        return false
      end
    end
  end
  stack.empty?
end
