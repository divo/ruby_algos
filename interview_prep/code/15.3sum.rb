# @param {Integer[]} nums
# @return {Integer[][]}
# Input: nums = [-1,0,1,2,-1,-4]
# Sorted input: [-4, -1, -1, 0, 1, 2]
# This is a variation on 2 pointers, find the compliment of each pair
# Iterate over the array and for each i, find a pair that sums to it's compliment
def three_sum(nums)
  result = []
  nums.sort!
  nums.each_with_index do |num, idx|
    # This and line 16 are how we avoid duplicates
    next if idx > 0 && num == nums[idx - 1]

    search_pair(nums, nums[idx] * -1, idx + 1, result)
  end
  result
end

def search_pair(nums, target, left, result)
  right = nums.length - 1
  while left < right
    sum = nums[left] + nums[right]
    if sum == target
      result << [target * -1, nums[left], nums[right]]
      left += 1
      # Needed to avoid duplicates, this is the exact same line 14
      # Skip any number that is a duplicate
      left += 1 while nums[left] == nums[left - 1] && left < right
    elsif sum < target
      left += 1
    else
      right -= 1
    end
  end
end


def three_sumNpow3(nums)
  result = []
  for i in 0...nums.length
    for j in i + 1...nums.length
      for k in j + 1 ...nums.length
        if nums[i] + nums[j] + nums[k] == 0
          ele = [nums[i], nums[j], nums[k]].sort
          result << ele unless result.include?(ele)
        end
      end
    end
  end
  result
end

