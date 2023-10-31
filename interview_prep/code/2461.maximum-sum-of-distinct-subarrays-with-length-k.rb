# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
# Input: nums = [1,5,4,2,9,9,9], k = 3
def maximum_subarray_sum(nums, k)
  max_sum, window_sum = 0, 0
  window_start = 0
  # Need a window of size k, sum the elements, if larger than max set new max
  # To advance the window remove first element, add new element
  nums.each_with_index do |num, window_end|
    window_sum += num
    if window_end >= k - 1
      window = nums[window_start..window_end]
      max_sum = [max_sum, window_sum].max if window.uniq.size == window.size
      window_sum -= nums[window_start]
      window_start += 1
    end
  end
  max_sum
end

def maximum_subarray_sum_slow(nums, k)
  max = nums.each_cons(k)
      .select { |x| x.uniq.size == x.size }
      .max { |a, b| a.sum <=> b.sum }
  max ? max.sum : 0
end

puts maximum_subarray_sum([1,5,4,2,9,9,9], 3)
