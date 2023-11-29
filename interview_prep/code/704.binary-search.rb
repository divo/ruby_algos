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

  while left <= right # Stop when left OVERTAKES right, = is important for arrays of length 1
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

  -1
end

def binary_search_recursive(nums, target, low = nil, high = nil)
  low ||= 0
  high ||= nums.length - 1

  return -1 if low > high

  mid = (low + high) / 2

  if nums[mid] == target
    mid
  elsif mid > target
    binary_search_recursive(nums, target, low, mid - 1)
  else
    binary_search_recursive(nums, target, mid + 1, high)
  end
end
