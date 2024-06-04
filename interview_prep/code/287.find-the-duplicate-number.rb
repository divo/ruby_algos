# @param {Integer[]} nums
# @return {Integer}
def find_duplicate(nums)
  nums.each_with_index do |val, idx|
    return val unless nums[idx + 1..].select { |x| x == val }.empty?
  end
end

def find_duplicate_sort_extra_mem(nums)
  last = nil
  # This is using extra space though!
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
