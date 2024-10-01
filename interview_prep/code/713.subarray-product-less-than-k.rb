# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def num_subarray_product_less_than_k(nums, k)
  require 'byebug'; byebug;
  left, right = 0, 0
  result = 0
  while left <= nums.length
    product = nums[left..right].reduce(&:*)
    puts nums[left..right]
    puts ""
    if product < k
      result += 1

      if right < (nums.length - 1)
        right += 1
      else
        left += 1
      end
    else
      left += 1
    end
  end

  result
end

puts num_subarray_product_less_than_k([10, 5, 2, 6], 100)
