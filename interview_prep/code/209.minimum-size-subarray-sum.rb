# @param {Integer} target
# @param {Integer[]} nums
# @return {Integer}
# [4, 3, 3, 2, 2, 1]
# [5, 4, 3, 2, 1]
def min_sub_array_len(target, nums)
  sum = 0
  result = nums.sort.reverse.take_while do |x|
    sum += x
    target > sum
  end

  result.size == nums.size ? 0 : result.size + 1
end

# min_sub_array_len(11, [5, 4, 3, 2, 1])
min_sub_array_len(7, [4, 3, 3, 2, 2, 1])
