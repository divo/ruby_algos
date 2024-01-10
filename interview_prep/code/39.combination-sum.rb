# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}
def combination_sum(candidates, target)
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
