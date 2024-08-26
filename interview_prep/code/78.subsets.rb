# @param {Integer[]} nums
# @return {Integer[][]}
def subsets(nums)
  result = [[]]
  nums.each do |n|
    result.length.times do
      partial = result.shift
      result << partial
      result << (partial + [n])
    end
  end
  result
end
