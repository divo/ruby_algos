# @param {Integer[]} nums
# @return {Integer}
# [-2,1,-3,4,-1,2,1,-5,4]
# s 1
# m 6
def max_sub_array(nums)
  sum = 0
  #  nums.each do |num|
  #    sum = [sum, 0].max + num
  #    max = [sum, max].max
  #  end
  nums.reduce(nums.first) do |max, n|
    sum = [sum, 0].max + n
    [sum, max].max
  end
end
