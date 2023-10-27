# @param {Integer[]} nums
# @return {Integer}
# Input: nums = [0,0,1,1,1,2,2,3,3,4]
# Output: 5, nums = [0,1,2,3,4,_,_,_,_,_]
def remove_duplicates(nums)
  last_non_dup = 1
  for i in 1...nums.length
    if nums[i] != nums[last_non_dup - 1]
      nums[last_non_dup] = nums[i]
      last_non_dup += 1
    end
  end

  return last_non_dup
end

puts remove_duplicates([0,0,1,1,1,2,2,3,3,4])
