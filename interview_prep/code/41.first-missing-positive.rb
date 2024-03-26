# @param {Integer[]} nums
# @return {Integer}
def first_missing_positive(nums)
  sorted = [0] # We only want positive numbers, so start with [0] to offset indices
  nums.each do |x|
    sorted[x] = x unless x <= 0
  end

  sorted.index(nil) || sorted.length
end

