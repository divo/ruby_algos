# @param {Integer[]} nums
# @return {Integer[][]}
# Input: nums = [-1,0,1,2,-1,-4]
def three_sum(nums)
  result = []
  for i in 0...nums.length
    for j in i + 1...nums.length
      for k in j + 1 ...nums.length
        if nums[i] + nums[j] + nums[k] == 0
          ele = [nums[i], nums[j], nums[k]].sort
          result << ele unless result.include?(ele)
        end
      end
    end
  end
  result
end

