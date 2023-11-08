class BinarySearchTree
  # These are needed because insert is static
  attr_reader :value
  attr_accessor :left, :right

  def initialize(value)
    @value = value
  end

  def search(value)
    if @value == value
      return self
    end

    if value < @value
      @left&.search(value) || nil
    else
      @right&.search(value) || nil
    end
  end

  # Can I do this as an instance method?
  def self.insert(value, node, parent)
    if node.nil? # Base case
      node = BinarySearchTree.new(value)
    elsif value < parent.value
      BinarySearchTree.insert(value, parent.left, node)
    else
      BinarySearchTree.insert(value, parent.right, node)
    end
  end

  # This is not a balanced binary tree, just a Binary Search Tree
  def insert(value)
    if value < self.value
      if left.nil?
        @left = BinarySearchTree.new(value)
      else
        left.insert(value)
      end
    elsif value > self.value
      if right.nil?
        @right = BinarySearchTree.new(value)
      else
        right.insert(value)
      end
    end
  end

  # In-Order traversal
  def traverse_tree
    result = left.nil? ? "" : left.traverse_tree
    result += "#{value}\n"
    result += right.nil? ? "" : right.traverse_tree
  end

  # BFS
  def print_tree
    queue = [self]

    while queue.any?
      item = queue.shift

      next if item.nil?

      puts "#{item.value} "
      queue << item.left << item.right
    end
  end

  # DFS
  def print_tree_df
    stack = [self]

    while stack.any?
      item = stack.pop

      next if item.nil?

      puts item.value
      stack << item.right << item.left
    end
  end

  def find_min
    return left.find_min unless left.nil?

    return value
  end

  def find_max
    return right.find_max unless right.nil?

    return value
  end
end

# Produces the following tree.
# This is a binary search tree, not a balanced tree
#         5
#       /   \
#       2    6
#        \    \
#         4   7
#         /
#        3
root = BinarySearchTree.new(5)
root.insert(2)
root.insert(6)
root.insert(4)
root.insert(7)
root.insert(3)
puts root.print_tree()
puts root.print_tree_df()
puts root.find_min()
puts root.find_max()
