# @param {Integer[]} nums
# @return {Integer[][]}
# Solution I came up with. Took maybe an hour but
# honestly isn't to bad
def subsets(nums)
  return backtrack(nums)

  result = [[]]
  nums.each do |n|
    result.length.times do
      partial = result.shift
      result << partial
      result << (partial + [n])
    end
  end
  result
end

def backtrack(input)
  subset = []
  result = []

  dfs = lambda do |position|
    if position == input.length
      result << subset.zip(input).reduce([]) { |result, (p, i)| p ? result << i : result }
      return result
    end

    [true, false].each do |candidate|
      subset[position] = candidate
      dfs.call(position + 1)
    end
  end

  dfs.call(0)
  result
end
