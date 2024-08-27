# Exmaple implementation of Backtracking from Algorithm Design manual
# Specifically to generate all subsets
# Assume this is non-functional pseudo code

# Generic backtrack solution
# def backtrack_from_book(partial, input, result, position = 0)
#   if a_solution?(partial, position, input)
#     result << process_solution(partial, input)
#   else
#     candidates = construct_candidates
#     candidates.each do |candidate|
#       partial[position] = candidate
#       backtrack(partial, input, result, position + 1)
#     end
#   end
#   result
# end
class AlgorithmDesign
  def backtrack(input)
    partial = []
    result = []

    dfs = lambda do |position|
      if a_solution?(position, input)
        result << process_solution(partial, input)
      else
        construct_candidates.each do |candidate|
          partial[position] = candidate
          dfs.call(position + 1)
        end
      end
    end

    dfs.call(0)
    result
  end

  # Return true if the first k elements of partial form a complete solution
  # input is for general information needed by the function,
  # For generating all subsets we use it to pass the size of the input set
  def a_solution?(position, input)
    position == input.length
  end

  # Return the complete set of possible candidates for the kth
  # position of partial, given the contents at k - 1
  # def construct_candidates(_partial, _position, _input)
  def construct_candidates
    [true, false]
  end

  # Print, count, or otherwise process the solution once found
  def process_solution(partial, input)
    # partial = [true, true, true]
    # input = [1, 2, 3]
    # zip = [[true, 1], [true, 2], [true, 3]]
    # If partial[i] is true, include input[i] in the result, else skip it
    partial.zip(input).reduce([]) { |result, (p, i)| p ? result << i : result }
  end
end

# Collapsed version
def subsets(nums)
  dfs([], nums, [])
end

def dfs(partial, input, result, position = 0)
  if partial.length == input.length
    result << partial.zip(input).reduce([]) do |result, (p, i)|
      p ? result << i : result
    end
  else
    [true, false].each do |candidate|
      partial[position] = candidate
      backtrack(partial, input, result, position + 1)
    end
  end
  result
end

# Neetcode
class Neetcode
  def subsets(nums)
    result = []
    subset = []

    dfs = lambda { |i|
      if i >= nums.length
        result << subset.clone
        return
      end

      subset << nums[i]
      dfs.call(i + 1)
      subset.pop
      dfs.call(i + 1)
    }

    dfs.call(0)
    result
  end
end

# Generate all subsets of `input`
pp AlgorithmDesign.new.backtrack([1, 2, 3])
# pp subsets([1, 2, 3])
pp Neetcode.new.subsets([1, 2, 3])
