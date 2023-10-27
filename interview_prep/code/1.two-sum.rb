# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  map = {}
  for i in 0..nums.length do
    map[nums[i]] = i
  end

  for i in 0..nums.length do
    complement = target - nums[i]
    if map.include?(complement) && map[complement] != i
      return [i, map[complement]]
    end
  end
end

def two_sum_brute_force(nums, target)
  l_index, r_index = 0, 0
  nums.each_with_index do |r_val, idx| 
    l_index = idx
    nums[idx + 1..nums.length].each_with_index do |l_val, inner_idx|
      r_index = inner_idx + idx + 1 # each_with_index means I have to add prior index
      if r_val + l_val == target
        return [l_index, r_index]
      elsif l_val > target
        next
      end
    end
  end
end
