def contains_duplicate(nums)
  return false if nums.empty?
  head = nums.shift
  nums.each do |x|
    return true if head == x
  end
  contains_duplicate(nums)
end


puts contains_duplicate([0,1,2,3,4,5])
puts contains_duplicate([0,1,2,3,1,5])
