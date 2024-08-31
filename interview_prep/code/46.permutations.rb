# @param {Integer[]} nums
# @return {Integer[][]}
def permute(nums)
  result = []

  dfs = lambda do |position, subset, candidates|
    if subset.length == nums.length
      result << subset
      return
    end

    candidates.each do |n|
      subset[position] = n
      dfs.call(position + 1, subset.clone, candidates - [n])
    end
  end

  dfs.call(0, [], nums)

  result
end

def permute(nums)
  result = []
  build([], nums, result)
  result
end

def build(current, nums, result)
  if nums.empty?
    result << current.dup
    return
  end

  nums.each do |head|
    current << head
    build(current, nums - [head], result)
    current.pop
  end
end

def permute_simple(nums)
  nums.permutation(nums.length).to_a
end
