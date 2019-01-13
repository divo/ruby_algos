def search(nums, target)
  left = 0
  right = nums.count - 1 #NOTE: This is important

  loop do
    return -1 if left > right
    middle = (left + right) / 2 #NOTE: THIS IS HOW TO MID POINT STOOGE
    subject = nums[middle]
    if target == subject
      return middle
    elsif target < subject # 
      right = middle - 1 #NOTE: THIS IS EDGES HOW ARE CHANGED
    else
      left = middle + 1
    end
  end
end

puts search([-1,0,3,5,9,12], 13)
