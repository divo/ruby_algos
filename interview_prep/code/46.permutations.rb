# @param {Integer[]} nums
# @return {Integer[][]}
def permute(nums)
  nums.permutation(nums.length).to_a
end
