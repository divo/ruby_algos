# @param {Integer[]} prices
# @return {Integer}
# [7,1,5,3,6,4]
# Iterate over the array, keeping track of the min value and using that to determine profit
def max_profit(prices)
  result = 0
  min = prices.first
  prices.each do |price|
    min = [price, min].min
    result = [result, price - min].max
  end

  result
end
