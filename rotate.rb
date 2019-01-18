def rotate(nums, k)
  k %= nums.length # I didn't account for k > nums.length
  k.times do
    nums.unshift(nums.pop) # Take last element and put it on the front
  end
  return
end
