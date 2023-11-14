# @param {Integer[]} nums
# @return {Integer}
def longest_consecutive(nums)
  set = Set.new(nums)
  nums.reduce(0) do |max, x|
    unless set.include?(x - 1)
      len = 0
      while set.include?(x + len)
        len += 1
        max = [max, len].max
      end
    end

    max
  end
end
