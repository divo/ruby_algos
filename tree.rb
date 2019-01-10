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

  # pre-order traversal
  def to_s
    "#{@value} -> Left: #{@children[LEFT].to_s} Right: #{@children[RIGHT].to_s}"
  end

  #def in-order traversal
  def traverse_tree
    result = @children[LEFT].nil? ? "" : @children[LEFT].traverse_tree
    result += ":LEFT <- #{@value} -> RIGHT:"
    result += @children[RIGHT].nil? ? "" : @children[RIGHT].traverse_tree
  end

  def dfs(value)
    $found = false #This is a bit shit
    _dfs(value)
  end

  $found = false
  def _dfs(value)
    if $found; return; end

    puts "#{@value}"
    if value == @value
      puts "Found #{value}"
      # Need to halt further calls
      $found = true
      return self
    end

    @children.each do |child|
      unless child.nil?
        child._dfs(value)
      end
    end

    nil
  end

  # This isn't correct, need to visit every node
  def height(level = 1)
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
root.insert(BinNode.new(3))
root.insert(BinNode.new(6))
root.insert(BinNode.new(7))
root.insert(BinNode.new(9))
puts root
puts root.traverse_tree
puts root.dfs(9)
puts ""
puts root.dfs(3)

tree2 = BinNode.new(1)
tree2.insert(BinNode.new(2))
tree2.insert(BinNode.new(3))
tree2.insert(BinNode.new(4))
tree2.insert(BinNode.new(5))
puts tree2

puts tree2.traverse_tree
