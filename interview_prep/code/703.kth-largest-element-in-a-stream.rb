# Implement a heap
# Need a method to bubble up inserted elements

class KthLargest
  def initialize(k, nums)
    @k = k
    @nums = nums
  end

  # Return kth largest element
  def add(val)
    @nums << val
    @nums.sort!.reverse[@k - 1]
  end
end

# Your KthLargest object will be instantiated and called as such:
# obj = KthLargest.new(k, nums)
# param_1 = obj.add(val)
