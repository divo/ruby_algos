# @param {Integer[]} nums
# @return {Integer}
# Input: nums = [4,5,6,7,0,1,2]
# l: 4
# r: 6
# mid: 5
def find_min(nums)
  left, right = 0, nums.length - 1
  result = nums[left]

  while left <= right do
    if nums[left] < nums[right]
      return [result, nums[left]].min # What?
    end

    mid = (left + right) / 2
    result = [result, nums[mid]].min

    if nums[mid] >= nums[left]
      left = mid + 1
    else
      right = mid - 1
    end
  end

  result
end

def find_min_wrong(nums)
  left, right = 0, nums.length - 1
  while left < right
    mid = (right + left) / 2
    if nums[left] > nums[right]
      left = mid
    else
      right = mid
    end
  end
  nums[left]
end
