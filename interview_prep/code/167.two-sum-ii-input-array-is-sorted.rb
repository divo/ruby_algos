# @param {Integer[]} numbers
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  l, r = 0, nums.length - 1
  while l < r
    sum = nums[l] + nums[r]
    if sum == target
      return [l.next, r.next]
    elsif sum < target
      l += 1
    else 
      r -= 1
    end
  end
end
