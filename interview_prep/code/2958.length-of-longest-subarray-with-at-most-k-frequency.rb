# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
# Input: nums = [1,2,3,1,2,3,1,2], k = 2
def max_subarray_length(nums, k)
  freqs = Hash.new(0)
  result = 0
  left = 0

  nums.each_with_index do |current, right|
    freqs[current] += 1
    if freqs[current] <= k
      result = [result, 1 + right - left].max
    else
      while freqs[current] > k
        freqs[nums[left]] -= 1
        left += 1
      end
    end
  end

  result
end
