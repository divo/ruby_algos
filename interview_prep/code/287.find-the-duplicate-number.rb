# @param {Integer[]} nums
# @return {Integer}
def find_duplicate(nums)
  seen = Array.new(nums.length)
  nums.each do |n|
    return n if seen[n]

    seen[n] = n
  end
end
