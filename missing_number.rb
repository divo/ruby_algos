# @param {Integer[]} nums
# @return {Integer}
def missing_number(nums)
    nums = nums.sort
    # Check input
    return nums.length unless nums.last == nums.length
    return 0 unless nums.first == 0
     
    nums.each_with_index do |num, index|
       return index if num != index  
    end
end

# or
def missing_number(nums)
   return (0..nums.length).sum - nums.sum
end
