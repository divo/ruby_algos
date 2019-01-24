def contains_duplicate(nums)
  return false if nums.empty?
  head = nums.shift
  nums.each do |x|
    return true if head == x
  end
  contains_duplicate(nums)
end

# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
    return false if nums.empty?
    nums = nums.sort
    nums[0, nums.length - 1].each_with_index do |num, index|
        return true if num == nums[index.next]
    end
    false
end


puts contains_duplicate([0,1,2,3,4,5])
puts contains_duplicate([0,1,2,3,1,5])
