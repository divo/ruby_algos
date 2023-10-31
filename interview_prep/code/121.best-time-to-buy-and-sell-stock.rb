# @param {Integer[]} prices
# @return {Integer}
#def max_profit(prices)
#  # O(n!)
#  result = 0
#  (0...prices.count).each do |buy|
#    (buy.next...prices.count).each do |sell|
#      profit = prices[sell] - prices[buy]
#      if profit > result
#        result = profit
#      end
#    end
#  end
#
#  result
#end

def max_profit(prices)
  result = 0
  min = prices.first

  prices.each do |price|
    min = [min, price].min
    result = [result, price - min].max
  end

  result
end

def max_profit_n!(prices)
  result = 0
  prices.each_with_index do |buy, index|
    prices[index + 1..].each do |sell|
      profit = sell - buy
      result = profit if profit > result
    end
  end
  result
end
