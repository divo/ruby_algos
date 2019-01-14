# Return the length of the array
# Modify the array in place to remove duplicates
# What's left in the array doesn't matter
def remove_duplicates(nums)
  return 0 if nums.empty?
  head = nums.first
  nums[1...nums.count].each_with_index do |val, index|
    break if head >= nums.last
    if val <= head
      head += 1
      nums[index + 1] = head # Use a for loop to remove this shit
    end
  end

  nums = nums[0..head - 1]
  return head
end

input = [0,0,1,1,1,2,2,3,3,4]
#input = [1,1,2]
puts remove_duplicates(input)
puts ""
puts input


