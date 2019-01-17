# This is find the longest non-overlapping path

def max_profit(prices)
  profits = profits(prices)
  max_profits(profits)
end

def max_profits(profits)
  result = Array.new()
  profits[0].each_with_index do |row, i|
    mx = 0
    mx_idx = nil
    
    for j in 0...profits.count
      if profits[j][i] > mx
        mx = profits[j][i]
        max_idx = j
      end
    end
    
    unless max_idx.nil?
      # profits[mx_idx] = nil Cant do this, each isn't that smart

      profits[max_idx].each { |val| val = 0 }
      for i in 0..profits[max_idx].count 
        profits[max_idx][i] = 0 
      end
      result.push mx
    end
  end
  
  result
end

def profits(prices)
  result = Array.new() # Do I need to declare this?
  prices.each_with_index do |price, current|
    # First push on the nils
    row = Array.new()
    (0..current).each { row.push 0 }
    prices[current + 1, prices.count].each do |x|
      row.push(x - price)
    end
    print row
    puts ""
    result.push row
  end
  result
end

puts max_profit([7,1,5,3,6,4])
# Output here is 7. Buy for 1, sell for 5, then buy for 3 and sell for 6
# I think the best thing to do is brute force it? So there are N * N * N combinations. Hmmm
# This is the same as the movies question. Find the max number of of non-overlapping durations
# It only makes sense to buy lower than you sell, and sell lower than you buy so we could do
# Buy: Here we want the smallesst numbers.
# 7: [nil, nil, nil etc]
# 1: [nil, nil, 5, 3, 6, 4]
# 5: [nil, nil, nil, nil, 6, nil]
# 3: [n, n, n, n, 6, 4]
# But we should calculate the spend. Come back to this
# 7: [nil, nil, nil etc] Do we need to bother with nil? Leave for now
# 1: [nil, nil, 5, 3, 6, 4]
# 5: [nil, nil, nil, nil, 6, nil]
# 3: [n, n, n, n, 6, 4]

# Sell: Here we want the greatest numbers. Calculate the profit
# 7: [nil, -6, -2, -4, -1, -3]
# 1: [nil, nil, 4, 2, 5, 3]
# 5: [nil, nil, nil, -2, 1, -1]
# 3: [nil, nil, nil, nil, 3, 1]
# Ok, now we have something that looks useful. Don't think we need to bother with
# calcualting the buy.
# Now the rules. We want to take 4 from No1 and 3 from no2. We can only take from one
# array at once and only proceeded forwards.
# After we buy from an array we remove it. 
# So we can try picking the greatest number from each array for every position, then remove that array.
# So 1) Compute sells 2) Take maxes
# Max + Profits. It's right there in the problem description. Break it apart
