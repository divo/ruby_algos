# @param {Integer[]} nums
# @return {Integer[]}
# Input: [-2, -1, 0, 2, 3]
# Output: [0, 1, 4, 4, 9]
# r 3 4 
# l 1 1
#
# This is not correct
# Correct thing to do is search from either end, not from the middle
def sorted_squares(nums)
  r = nums.index { |x| x >= 0 }
  l = r - 1
  result = []

  while result.length < nums.length do
    lsqr = nums[l] * nums[l]
    rsqr = nums[r] * nums[r]

    if lsqr < rsqr
      result << lsqr
      l -= 1
    else
      result << rsqr
      r += 1
    end
  end

  result
end
