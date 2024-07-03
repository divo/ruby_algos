# @param {Integer[]} piles
# @param {Integer} h
# @return {Integer}
def min_eating_speed(piles, h)
  k = 1
  loop do
    remaining_h = h
    piles_copy = piles.dup
    while remaining_h > 0
      piles_copy.sort!.reverse!
      pile = piles_copy.shift
      hours_taken = pile < k ? 1 : pile / k
      b_remaining = pile < k ? 0 : pile % k
      piles_copy << b_remaining
      remaining_h -= hours_taken
    end

    return k if piles_copy.sum.zero?
    k += 1
  end


end

