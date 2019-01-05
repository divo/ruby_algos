LEFT = 0
RIGHT = 1
# Binary Tree Node
class BinNode
  @children
  @value

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
    # TODO NEXT
  end

  def height(level)
    if @children[LEFT] != nil
      return @children[LEFT].height(level + 1)
    elsif @children[RIGHT] != nil
      return @children[RIGHT].height(level + 1)
  end

  private
  def insert_child(index, node)
    if @children[index] == nil
      @chilren[index] = node
    else
      @children[index].insert(node)
    end
  end
end
