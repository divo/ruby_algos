# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  left = 0
  right = nums.count
  middle = find_middle(left, right)

  loop do
    subject = nums[middle]
    if target == subject
      return middle
    elsif target < subject
      right = middle
      middle = find_middle(left, right)
    else
      left = middle
      middle = find_middle(left, right)
    end
  end
end

def find_middle(left, right)
  (left + right) / 2 # THIS IS HOW TO MID POINT STOOGE
end

#puts search([-1,0,3,5,9,12], 2)
puts search([5], 5)
