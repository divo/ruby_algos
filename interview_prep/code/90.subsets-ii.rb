# @param {Integer[]} nums
# @return {Integer[][]}
def subsets_with_dup(nums)
  result = []

  dfs = lambda do |position, subset|
    if subset.length == nums.length
      result << subset.zip(nums).select(&:first).map(&:last)
      return
    end

    [true, false].each do |candidate|
      subset[position] = candidate
      dfs.call(position + 1, subset.clone)
    end
  end

  dfs.call(0, [])
  result.uniq(&:sort)
end

pp subsets_with_dup([1, 2, 2])
