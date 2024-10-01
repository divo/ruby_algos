# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}
# Input: candidates = [10,1,2,7,6,1,5], target = 8
# Output:
# [
# [1,1,6],
# [1,2,5],
# [1,7],
# [2,6]
# ]
def combination_sum2(candidates, target)
  return [] unless candidates.sum >= target

  result = []
  subset = []

  dfs = lambda do |position, subset, candidates|
    if subset.sum == target &&
       !result.include?(subset.sort)
      result << subset.sort
      return
    end

    candidates.each do |n|
      subset[position] = n
      updated_candidates = candidates.clone
      updated_candidates.delete_at(updated_candidates.index(n))
      dfs.call(position + 1, subset.clone, updated_candidates)
    end
  end

  dfs.call(0, [], candidates)
  result
end
