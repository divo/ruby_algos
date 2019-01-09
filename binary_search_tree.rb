class BinarySearchTree
  @value
  @left
  @right

  def initialize(value)
    value = value
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

  # In-Order traversal
  def traverse_tree
    result = @left.nil ? "" : @left.traverse_tree
    result += "#{value}"
    result += @right.nil ? "" : @right.traverse_tree
  end

  def find_min
    unless @left.nil
      return @left.find_min
    end
    return @value
  end
end
