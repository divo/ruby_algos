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
#

class MaxHeap
  def initialize
    @heap = nil
  end

  def add(value)
    unless @heap
      @heap = Node.new(value)
      return
    end

    new_node = insert_value(dfs_empty, value)
    balance(new_node)
  end

  # private

  def dfs_empty(current = @heap)
    return current if current.left.nil? || current.right.nil?

    dfs_empty(current.left)
  end

  # TODO: Clean this up
  def insert_value(node, value)
    child_node = Node.new(value, node)
    node.left.nil? ? node.left = child_node : node.right = child_node
    child_node
  end

  def balance(node)
    return if node.parent.nil? || node.value < node.parent.value

    node.value, node.parent.value = node.parent.value, node.value
    balance(node.parent)
  end
end

class Node
  attr_reader :parent
  attr_accessor :value, :left, :right

  def initialize(value, parent = nil)
    self.value = value
    @parent = parent
  end

  def inspect
    require 'byebug'
    byebug
    "#{value}\n #{left.inspect}, #{right.inspect}"
  end
end

require 'byebug'
byebug
heap = MaxHeap.new
heap.add(4)
heap.add(5)
heap.add(8)
heap.add(2)
pp heap
