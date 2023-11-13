# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def top_k_frequent(nums, k)
  nums.each_with_object(Hash.new(0)) { |value, hash| hash[value] += 1 }
      .sort_by { |_, v| v }
      .reverse
      .take(k)
      .map { |x| x.first }
end
