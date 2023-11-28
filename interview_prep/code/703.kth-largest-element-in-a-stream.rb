# Implement a heap
# Need a method to bubble up inserted elements
class KthLargest
  def initialize(k, nums)
    @k = k
    @heap = []
    nums.each { |n| add_sorted(n) }
  end

  # Return kth largest element
  def add(val)
    add_sorted(val)
    @heap[@k - 1]
  end

  private

  def add_sorted(val)
    @heap << val
    bubble_up(@heap.length - 1)
  end

  def bubble_up(i)
    parent = (i / 2).floor
    if i >= 0 && @heap[parent] < @heap[i]
      @heap[parent], @heap[i] = @heap[i], @heap[parent]
      bubble_up(parent)
    end
  end
end

kth = KthLargest.new(3, [4, 5, 8, 2])
require 'byebug'; byebug;
puts kth.add 3
puts kth.add 5
puts kth.add 10
puts kth.add 9
# Your KthLargest object will be instantiated and called as such:
# obj = KthLargest.new(k, nums)
# param_1 = obj.add(val)

