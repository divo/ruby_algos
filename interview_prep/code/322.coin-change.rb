# @param {Integer[]} coins
# @param {Integer} amount
# @return {Integer}
def coin_change(coins, amount)
  return 0 if amount.zero?

  coins.sort!
  result = 0
  until coins.empty?
    coin = coins.pop
    quotient = amount / coin
    remainder = amount % coin
    # If the coin is too big we ignore it
    if quotient > 0
      result += quotient
      amount = remainder
    end

    if amount == 0
      return result
    end
  end

  return -1
end

require 'byebug'; byebug;
coin_change([186,419,83,408], 6249)
