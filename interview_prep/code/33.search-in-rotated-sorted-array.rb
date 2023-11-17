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
  result = -1

  while left <= right
    mid = (left + right) / 2
    if nums[mid] == target
      result = mid
      break
    end

    if nums[left] <= nums[mid]
      if nums[mid] > target && nums[left] <= target
        right = mid - 1
      else
        left = mid + 1
      end
    else
      if nums[mid] < target && nums[right] >= target
        left = mid + 1
      else
        right = mid - 1
      end
    end
  end

  result
end

def search_solution(nums, target)
  left = 0
  right = nums.size - 1
  result = -1

  while left <= right
    mid = (left + right) / 2
    if nums[mid] == target
      result = mid
      break
    end

    if nums[left] > nums[mid]
      if nums[mid] < target && target <= nums[right]
        left = mid + 1
      else
        right = mid - 1
      end
    else
      if nums[mid] > target && nums[left] <= target
        right = mid - 1
      else
        left = mid + 1
      end
    end
  end
  result
end
