class BinarySearchTree
  # These are needed because insert is static
  attr_reader :value
  attr_accessor :left
  attr_accessor :right

  @value
  @left
  @right

  def initialize(value)
    @value = value
  end

  def search(value)
    if @value == value
      return self
    end

    if value < @value
      return @left.nil? ? nil : @left.search(value)
    else
      return @right.nil? ? nil : @right.search(value)
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

  def insert(value)
    if value < @value
      if @left.nil?
        @left = BinarySearchTree.new(value)
      else
        @left.insert(value)
      end
    else
      if @right.nil?
        @right = BinarySearchTree.new(value)
      else
        @right.insert(value)
      end
    end
  end

  # In-Order traversal
  def traverse_tree
    result = @left.nil? ? "" : @left.traverse_tree
    result += "#{@value}"
    result += @right.nil? ? "" : @right.traverse_tree
  end

  def to_s
    traverse_tree
  end

  def find_min
    unless @left.nil
      return @left.find_min
    end
    return @value
  end
end

root = BinarySearchTree.new(5)
puts root.traverse_tree
BinarySearchTree.insert(4, root, root)
puts root
