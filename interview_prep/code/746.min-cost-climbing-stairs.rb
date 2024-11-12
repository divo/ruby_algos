# Input: cost = [10,15,20]
# Output: 15
# Input: cost = [1,100,1,1,1,100,1,1,100,1]
# Output: 6
# [0, 2, 2, 1]
# [0, 0, 1, 0]

# @param {Integer[]} cost
# @return {Integer}
def min_cost_climbing_stairs(cost)
  two = cost.pop
  one = cost.pop
  cost.reverse.each do |c|
    one, two = c + [one, two].min, one
  end

  [one, two].min
end
