# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}
# March 2nd 2025
# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}
# [2,3,6,7]
def combination_sum(candidates, target)
  result = []

  dfs = lambda do |partial, index|
    sum = partial.sum
    return if sum > target

    if sum == target
      result << partial.clone
      return
    end

    (index...candidates.size).each do |i| # This is the line I struggle with
      partial << candidates[i]
      dfs.call(partial, i)
      partial.pop
    end
  end

  dfs.call([], 0)
  result
end

# Aug 30th 2024
def combination_sum(candidates, target)
  # For each n in candidates, generate a set for each n in candidates
  # Add it to result when the set sums to the target
  result = []

  dfs = lambda do |position, subset|
    return if subset.sum > target

    if subset.sum == target
      result << subset
      return result
    end

    candidates.each do |n|
      subset[position] = n
      dfs.call(position + 1, subset.clone)
    end
  end

  dfs.call(0, [])
  result.uniq(&:sort) # Not a proper solution!
end

def combination_sum_old(candidates, target)
  result = []
  dfs([], 0, result, candidates, target)
  result
end

def dfs(current, k, result, candidates, target)
  return if k >= candidates.size

  return if current.sum > target

  if current.sum == target
    result << current.dup
    return
  end

  current << candidates[k]
  dfs(current, k, result, candidates, target)
  current.pop
  dfs(current, k + 1, result, candidates, target)
end

def combination_sum_nested(candidates, target)
  @result = [] # ANKI: Nested functions can only access instance variables
  @target = target
  @candidates = candidates

  def dfs(current, k)
    return if k >= @candidates.size

    return if current.sum > @target

    if current.sum == @target
      @result << current.dup # Would not have got this
      return
    end

    current << @candidates[k]
    dfs(current, k)
    current.pop # A little wasteful but easier to reason about
    dfs(current, k + 1)
  end

  dfs([], 0)
  @result
end

def combination_sum_bad(candidates, target)
  result = []
  10.times do |n|
    result += candidates
              .repeated_permutation(n)
              .select { |x| x.sum == target }
              .map(&:sort)
              .uniq
  end
  result.compact.reject(&:empty?)
end

# puts combination_sum([2, 3, 5], 8)
