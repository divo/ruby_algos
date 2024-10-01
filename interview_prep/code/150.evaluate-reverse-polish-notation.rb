# @param {String[]} tokens
# @return {Integer}
# ["4","13","5","/","+"]
def eval_rpn(tokens)
  # Create a stackm pushing elements until you encounter an operand
  # Then pop off the last two items and apply the operand, pushing result back onto the stack
  stack = []
  tokens.each do |token|
    case token
    when '+'
      r, l = stack.pop, stack.pop
      stack << l + r
    when '/'
      r, l = stack.pop, stack.pop
      result = l / (r * 1.0) # Hack to get around ruby number oddness
      stack << (result.negative? ? result.ceil : result.floor)
    when '*'
      r, l = stack.pop, stack.pop
      stack << l * r
    when '-'
      r, l = stack.pop, stack.pop
      stack << l - r
    else
      stack << token.to_i
    end
  end
  stack.first
end
