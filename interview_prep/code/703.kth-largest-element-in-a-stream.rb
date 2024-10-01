# Implement a heap
# Need a method to bubble up inserted elements

class KthLargest
  def initialize(k, nums)
    @heap = MaxHeap.new(nums)
    @k = k
  end

  # Return kth largest element
  def add(val)
    @heap.add(val)
    @k.times { @heap.pop }
    @heap.root
  end
end

# Your KthLargest object will be instantiated and called as such:
# obj = KthLargest.new(k, nums)
# param_1 = obj.add(val)
#

class MaxHeap
  def initialize(nums = [])
    @heap = nil
    nums.each { |n| add(n) }
  end

  def root
    @heap.value
  end

  def add(value)
    unless @heap
      @heap = Node.new(value)
      return
    end

    new_node = insert_value(bfs_empty, value)
    balance(new_node)
  end

  def pop
    # Find the bottom right most node and mark for deletion
    marked_node = find_bottom_right
    # Replace the root value with marked node value
    @heap.value = marked_node.value
    # Remove the marked node by deleting it's parent value
    marked_node.parent.left == marked_node ? marked_node.parent.left = nil : marked_node.parent.right = nil
    marked_node.parent = nil

    balance_top(@heap)
  end

  # private

  def bfs_empty
    queue = [@heap]
    until queue.empty?
      current = queue.shift
      return current if current.left.nil? || current.right.nil?

      queue << current.left << current.right
    end
  end

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

  def balance_top(node)
    # I have to unwrap to handle nils like this, if I do it in <=> and present nil as 0
    # it will break include
    return if node.value > (node&.left&.value || 0) && node.value > (node&.right&.value || 0)

    larger_node = node.left > node.right ? node.left : node.right
    node.value, larger_node.value = larger_node.value, node.value
    balance_top(larger_node)
  end

  def find_bottom_right
    queue = [[@heap]]
    previous_level = nil
    until queue.empty?
      level = queue.pop
      return previous_level.last if level.all?(nil)
      return level.compact.last if level.include?(nil)

      queue << level.map { |node| [node.left, node.right] }.flatten
      previous_level = level
    end
  end
end

class Node
  include Comparable
  attr_accessor :value, :left, :right, :parent

  def initialize(value, parent = nil)
    self.value = value
    @parent = parent
  end

  def inspect
    "#{value}\n #{left.inspect}, #{right.inspect}"
  end

  def <=>(other)
    value <=> other&.value
  end
end

require 'byebug'
heap = KthLargest.new(3, [4, 5, 8, 2])
heap.add(3)
byebug
heap.add(5)
heap.add(10)
heap.add(9)
heap.add(4)
pp heap
