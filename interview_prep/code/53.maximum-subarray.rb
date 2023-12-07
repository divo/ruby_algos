# @param {Integer[]} nums
# @return {Integer}
# [-2,1,-3,4,-1,2,1,-5,4]
# s 1
# m 6
def max_sub_array(nums)
  max = -100000000
  sum = 0
  nums.each do |num|
    sum += num
    max = [sum, max].max
    sum = 0 if sum <= 0
  end
  max
end
