# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
# Input: nums = [4,5,6,7,0,1,2], target = 0
# [6 7 0 1 2 4 5] t = 0
# [1]
# [3, 1]
# l: 0
# r: 1
# mid: = 0
#
def search(nums, target)
  left, right = 0, nums.length - 1    
  while left <= right
    mid = (left + right) / 2
    if nums[left] == target
      return left
    end

    if nums[left] < nums[mid] # In the sorted section
      if nums[left] < target # Need to search to the left
        right = mid - 1
      else
        left = mid + 1
      end
    else # nums[left] > nums[mid]
      if nums[mid] < target
        left = mid + 1
      else 
        right = mid - 1
      end
    end
  end

  return -1
end

# puts search([4,5,6,7,0,1,2], 0)
puts search([3, 1], 0)

