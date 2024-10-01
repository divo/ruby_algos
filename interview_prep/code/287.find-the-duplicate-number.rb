# @param {Integer[]} nums
# @return {Integer}
def find_duplicate(nums)
  # Use a fast and slow pointer, return when they meet
  return nums.first if nums.length <= 2

  slow, fast = 0, 1
  loop do
    return nums[slow] if nums[slow] == nums[fast]
    slow += 1
    fast += 2

    slow = 0 if slow >= nums.length
    fast = 1 if fast >= nums.length
  end
end

def find_duplicate_brute_force(nums)
  nums.each_with_index do |n, i|
    nums[(i + 1)..].each do |j|
      if j == n
        return n
      end
    end
  end
  return -1
end

# How to reset fast and slow so they don't meet?
find_duplicate([3,1,3,4,2])
find_duplicate([4,3,1,4,2])
