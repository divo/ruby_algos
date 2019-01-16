def _merge(nums1, m, nums2, n)
  # Pretty sure this is just "merge" from "merge sort"
  temp = Array.new(m + n)
  nums1.each_with_index { |val, index| temp[index] = val }
  nums2.each_with_index { |val, index| temp[m + index] = val }

  left, right, current = 0, m, 0
  while left <= m && right <= m + n
    if temp[left] <= temp[right] #If left < right, take left and advance it
      nums1[current] = temp[left]
      left += 1
    else
      nums1[current] = temp[right]
      right += 1
    end
    current += 1
  end

  for i in 0..(m + n - right)
    require 'byebug'; byebug
    nums1[current + i] = temp[right + i]
  end

  nums1
end


def merge(nums1, m, nums2, n)
  rightq = Array.new()
  for i in 0...m
    rightq.push(nums1[i])
  end
  leftq = nums2
  i = 0
  while !rightq.empty? && !leftq.empty? do
    if rightq.first < leftq.first
      nums1[i] = rightq.shift
    else
      nums1[i] = leftq.shift
    end
    i += 1
  end

  # Need to replace end of nums1 with whatever is left
  # This is shit but works
  remain = leftq.empty? ? rightq : leftq
  remain.each { nums1.pop }
  remain.each { |x| nums1.push(x) }

  nums1
end

#puts merge([1,2,3,0,0,0], 3, [2,5,6], 3)
puts merge([2,0], 1, [1], 1)
