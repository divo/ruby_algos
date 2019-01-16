def mergesort(nums, low, high)
  return unless low < high

  middle = (low + high) / 2
  mergesort(nums, low, middle)
  mergesort(nums, middle + 1, high)
  merge(nums, low, middle, high)
end

def merge(nums, low, middle, high)
  #1: Copy both halfs into a buffer
  helper = Array.new(high + 1)
  for i in low..high
    helper[i] = nums[i]
  end

  left, right, current = low, middle + 1, low
  # Iterate through the helper, comparing left and right and
  # copying the smaller into the target
  while left <= middle && right <= high
    if helper[left] <= helper[right]
      nums[current] = helper[left]
      left += 1
    else
      nums[current] = helper[right]
      right += 1
    end
    current += 1
  end

  for i in 0..(middle - left)
    nums[current + i] = helper[left + i]
  end
end

x = [5, 7, 98, 3, 1, 4, 0]
mergesort(x, 0, x.count - 1)
puts x
