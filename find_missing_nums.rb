# My solution that didn't work
# # @param {Integer[]} nums
# @return {Integer[]}
def find_disappeared_numbers(nums)
  nums = nums.sort # There goes O(n)
  result = []
  nums.each_with_index do |n, i|
    break if n == nums.last
    if (gap = nums[i + 1] - n) > 1
      (1...gap).each do |missing|
        result.push(n + missing)
      end
    end
  end
  result
end

# Some fucking wizzard
def find_disappeared_numbers(nums)
  (1..nums.count).to_a - nums
end
