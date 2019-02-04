# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  require 'byebug'; byebug
  nums.each_with_index do |num, index|
    nums[index.next, nums.length].each_with_index do |inner_num, inner_index| 
      return [index, inner_index + index.next] if num + inner_num == target
    end
  end
end

two_sum([2,7,11,15], 9)
