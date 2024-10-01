# @param {Integer[]} nums
# @return {Integer}
# Input: nums = [4,5,6,7,0,1,2]
# l: 4
# r: 6
# mid: 5
# Need to find the minimum, which probably means storing it temporarly
# In each iteration, we want to drop the unsorted section of the array
# If mid > right, move left to mid + 1
# else move right to mid
def find_min(nums)
  condition = ->(mid, right) { nums[mid] > nums[right] }

  left, right = 0, nums.length - 1
  while left < right
    mid = left + (right - left) / 2
    if condition.call(mid, right)
      left = mid + 1
    else
      right = mid
    end
  end
  nums[left]
end
