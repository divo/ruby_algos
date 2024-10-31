# @param {Integer[]} nums
# @return {Boolean}
# [2, 3, 1, 1, 4] true
# [3, 2, 1, 0, 4] false
# [0, 1] false
# [0] true
# [1, 1, 1, 0] true
# [3,4,0,1,0,0,3,0]
# current = 0
# sum = 0
def can_jump(nums)
  # Iterate back from the goal and see if anything can reach it
  # If it can, make that number the new goal and see what can reach that
  nums
    .each_with_index
    .to_a
    .reverse # [2, 3, 4] -> [[4, 2], [3, 1], [2, 0]] # Group nums with their idx and reverse it
    .reduce(nums.length - 1) do |goal, (num, idx)|
      goal - idx <= num ? idx : goal
    end
    .zero?
end
