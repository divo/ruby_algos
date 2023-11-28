# Implement a heap
# Need a method to bubble up inserted elements

require 'rb_heap"'
class KthLargest
  def initialize(k, nums)
    @k = k
    @heap = Heap.new
    nums.each { |n| @heap.add(n) }
    @heap.pop until @heap.size <= @k
  end

  # Return kth largest element
  def add(val)
    @heap.add(val)
    @heap.pop until @heap.size <= k
    @heap.peak
  end
end

# Your KthLargest object will be instantiated and called as such:
# obj = KthLargest.new(k, nums)
# param_1 = obj.add(val)

