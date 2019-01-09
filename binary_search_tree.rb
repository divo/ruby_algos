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
      return @left != nil ? @left.search(value) : nil
    else
      return @right != nil ? @right.search(value) : nil
    end
  end
end
