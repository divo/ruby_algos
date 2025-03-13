# @param {Integer[]} nums
# @return {Integer[]}
# O(n) time and O(1) space (result does not count towards space complexity)
# O(n) time and O(1) space (result does not count towards space complexity)
def product_except_self(nums)
  result = []
  # compute the prefix of products for each element
  total_product = 1
  nums.each do |num|
    result << total_product
    total_product *= num
  end

  # Reverse the iteration and compute the suffix sums
  total_product = 1
  (nums.length - 1).downto(0) do |idx|
    result[idx] = total_product * result[idx]
    total_product *= nums[idx]
  end
  result
end

def product_except_selfnpow2(nums)
  nums.map.with_index do |_, idx|
    acc = 1
    for i in (0...nums.length) do
      acc *= nums[i] unless i == idx
    end
    acc
  end
end
