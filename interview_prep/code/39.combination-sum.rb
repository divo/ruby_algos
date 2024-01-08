# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}
def combination_sum(candidates, target)
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
