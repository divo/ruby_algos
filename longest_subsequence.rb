# @param {Integer[]} nums
# @return {Integer}
def find_length_of_lcis(nums)
    return 0 if nums.empty?
    return 1 if nums.length == 1
    longest = []
    current = [nums.first]
    
    nums[1...nums.length].each do |n|
        if n > current.last
            current.push n
        else
            current = [n]
        end
        longest = current if current.length > longest.length
    end
    longest.length
end
