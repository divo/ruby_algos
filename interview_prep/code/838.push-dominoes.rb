# @param {String} dominoes
# @return {String}
# Walk the current state of dominoes and build its state for the next tick
# If current != future then set future = current and go again
# else return the future state
# Need rules of evaluation for each state. Look left and right and decide if need to update
def push_dominoes(dominoes)
  current = dominoes.chars
  future = ''
  loop do
    # Build dominos for next tick
    current.each_index do |i|
      future << update(current, i)
    end

    return future unless current.join != future

    current = future.chars
    future = ''
  end
end

def update(dom, i)
  return dom[i] if %w[L R].include?(dom[i])

  # If the left neighbour is moving right, we need to update
  result = ''
  result << 'R' if i - 1 >= 0 && dom[i - 1] == 'R'
  result << 'L' if i + 1 < dom.length && dom[i + 1] == 'L'

  return '.' if result.empty? || result == 'RL'

  result
end

