# @param {Integer[]} stones
# @return {Integer}
def last_stone_weight(stones)
  loop do
    stones.sort!
    return stones.last || 0 if stones.length <= 1

    y, x = stones.pop(2)
    if x != y
      stones << x - y
    end
  end
end
