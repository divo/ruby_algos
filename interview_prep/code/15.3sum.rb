# @param {Integer[]} nums
# @return {Integer[][]}
# Input: nums = [-1,0,1,2,-1,-4]
# Sorted input: [-4, -1, -1, 0, 1, 2]
def three_sum(nums)
  result = []
  nums.sort!.each_with_index do |target, idx|
    left, right = idx + 1, nums.length - 1

    next if idx.positive? && target == nums[idx - 1]

    while left < right
      case target + nums[left] + nums[right] <=> 0
      when 0
        result << [target, nums[left], nums[right]]
        left += 1
        left += 1 while nums[left] == nums[left - 1] && left < right
      when -1 # less than, move left
        left += 1
      when 1 # greater than, move right
        right -= 1
      end
    end
  end
  result
end
