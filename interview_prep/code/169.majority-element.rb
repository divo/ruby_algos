# @param {Integer[]} nums
# @return {Integer}
def majority_element(nums)
  nums
    .each_with_object(Hash.new(0)) { |num, hash| hash[num] += 1 }
    .max_by { |_, count| count }
    .first
end
