LEFT = 0
RIGHT = 1
# Binary Tree Node
class BinNode
  include Comparable

  @children
  @value
  attr_reader :value

  def initialize(value)
    @value = value
    @children = Array.new(2)
  end

  # Binary tree insert
  def insert(node)
    # Check the new nodes magnitude
    if node < self
      insert_child(LEFT, node)
    elsif node >= self
      insert_child(RIGHT, node)
    end
  end

  def <=>(other)
    return @value <=> other.value
  end

  def to_s
    "#{@value} -> Left: #{@children[LEFT].to_s} Right: #{@children[RIGHT].to_s}"
  end

  def height(level)
    if @children[LEFT] != nil
      return @children[LEFT].height(level + 1)
    elsif @children[RIGHT] != nil
      return @children[RIGHT].height(level + 1)
    end
  end

  private
  def insert_child(index, node)
    if @children[index].nil?
      @children[index] = node
    else
      @children[index].insert(node)
    end
  end
end

root = BinNode.new(5)
root.insert(BinNode.new(4))
root.insert(BinNode.new(6))
root.insert(BinNode.new(9))
puts root
