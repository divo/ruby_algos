# @param {Integer} n
# @return {Integer}
def climb_stairs(n)
  result = []

  dfs = lambda { |current|
    return if current.sum > n

    if current.sum == n
      result << current
      return
    end

    dfs.call(current + [1])
    dfs.call(current + [2])
  }

  dfs.call([])

  result.length
end
