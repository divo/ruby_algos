# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
# Input: nums = [-1,0,3,5,9,12], target = 2
# [5]
# Output: 4
# left: 0
# right: 0
# p: 0
# ele: 0
def search(nums, target)
  left, right = 0, nums.length - 1 

  while left <= right # Stop when left OVERTAKES right
    pivot = (right + left) / 2
    ele = nums[pivot]
    if ele == target
      return pivot
    elsif ele < target
      left = pivot + 1 # Shift 1 as we have examined the pivot already
    else
      right = pivot - 1
    end
  end

  return -1
end
