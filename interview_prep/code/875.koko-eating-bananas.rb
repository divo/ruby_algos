# @param {Integer[]} piles
# @param {Integer} h
# @return {Integer}
def min_eating_speed(piles, h)
  feasible = -> speed do
    piles.map do |pile|
      (pile / speed) + (pile % speed == 0 ? 0 : 1)
    end.sum <= h
  end

  left, right = 1, piles.max
  while left < right
    mid = (right + left) / 2
    if feasible.call(mid)
      right = mid
    else
      left = mid + 1
    end
  end
  left
end
