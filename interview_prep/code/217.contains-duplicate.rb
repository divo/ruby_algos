# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
  nums.each_with_object({}) do |num, hash|
    if hash[num]
      return true
    end
    hash[num] = true
  end
  return false
end
