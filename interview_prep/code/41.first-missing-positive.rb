# @param {Integer[]} nums
# @return {Integer}
def first_missing_positive(nums)
  # Create an array we append / preprend numbers to, keeping track of the min / max
  queue = MinMaxQueue.new
  nums.each { |x| queue.insert x }

  # Now I have a sorted queue, start with 1 and count up looking for a gap
  # [3 4 5 6]
  result = 0
  # Clean up with enumerator
  queue.queue.each do |x|
    if x - result != 1
      return result + 1
    else
      result = x
    end
  end
  result += 1
end

class MinMaxQueue
  attr_accessor :queue
  @min = nil
  @max = nil

  def initialize()
    @queue = []
  end

  def to_enum()
    queue
  end

  def insert(x)
    return if x <= 0

    if @min.nil? && @max.nil?
      @min = @max = x
      queue << x
    elsif x < @min
      @min = x
      queue.unshift x
    elsif x > @max
      @max = x
      queue.append x
    elsif @min < x && x < @max
      idx = queue.bsearch_index { |n| n > x }
      queue.insert(idx, x) unless queue[idx - 1] == x
    end
  end
end

