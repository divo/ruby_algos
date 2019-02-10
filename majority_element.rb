# @param {Integer[]} nums
# @return {Integer}
def majority_element(nums)
  counts = Hash.new
  nums.each do |num| 
    counts[num] = counts[num].nil? ? 0 : counts[num] += 1
  end
  
  majority_element = counts.keys.first
  counts.each do |key, value|
    if value > counts[majority_element]
      majority_element = key
    end
  end
    
  majority_element
end
