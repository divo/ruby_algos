# @param {Integer[]} nums
# @return {Integer}
# [1,2,3,1,1,3]
def num_identical_pairs(nums)
  result = 0

  (0..nums.length).each do |i|
    (i + 1..nums.length).each do |j|
      result += 1 if nums[i] == nums[j]
    end
  end

  return result
end

puts num_identical_pairs([1,2,3,1,1,3])
