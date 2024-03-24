# @param {Integer[]} nums
# @return {Integer}
def find_duplicate(nums)
  last = nil
  nums.sort.each do |n|
    return n if n == last

    last = n
  end
end

def find_duplicate_variable_mem(nums)
  seen = Array.new(nums.length)
  nums.each do |n|
    return n if seen[n]

    seen[n] = n
  end
end
