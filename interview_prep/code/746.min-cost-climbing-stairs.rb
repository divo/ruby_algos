# Input: cost = [10,15,20]
# Output: 15
# Input: cost = [1,100,1,1,1,100,1,1,100,1]
# Output: 6

# @param {Integer[]} cost
# @return {Integer}
def min_cost_climbing_stairs(cost)
  i = cost.length
  sum = 0
  until i <= 1
    if cost[i - 2] <= cost[i - 1]
      sum += cost[i - 2]
      i -= 2
    else
      sum += cost[i - 1]
      i -= 1
    end
  end
  sum
end
