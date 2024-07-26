# @param {Integer[]} prices
# @return {Integer}
# [7,1,5,3,6,4]
# Iterate over the array, keeping track of the min value and using that to determine profit
def max_profit(prices)
  result = 0
  min_price = prices[0]
  prices.each do |price|
    min_price = [min_price, price].min
    result = [result, price - min_price].max
  end

  result
end
