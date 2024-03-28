# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
# Input: nums = [1,2,3,1,2,3,1,2], k = 2
def max_subarray_length(nums, k)
  freqs = Hash.new(0)
  left, right = 0, 0
  result = 0

  # Left and right pointer, move right adding to counts until 
  # k is exceeded for right element
  # then move left until right elements k drops below k, 
  # while also dropping element in left
  while right < nums.length
    current = nums[right]
    # The checks are a little unintutive, we check < k and >= k (l: 22) because
    # we only increment the count after the check below passes. If we incremented 
    # before we checked we would increment again, incorrectly, after we 
    # finished moving left
    if freqs[current] < k
      freqs[current] += 1
      result = [result, 1 + right - left].max
      right += 1
    else
      while freqs[current] >= k
        freqs[nums[left]] -= 1
        left += 1
      end
    end
  end

  result
end

puts max_subarray_length([1,2,3,1,2,3,1,2], 2)
