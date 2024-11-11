# @param {Integer} n
# @return {Integer}
def climb_stairs(n)
  one = 1
  two = 1
  (n - 1).times { one, two = one + two, one }
  one
end

def climb_stairs_bf(n)
  result = 0

  dfs = lambda { |current|
    return if current > n

    if current == n
      result += 1
      return
    end

    dfs.call(current + 1)
    dfs.call(current + 2)
  }

  dfs.call(0)

  result
end
