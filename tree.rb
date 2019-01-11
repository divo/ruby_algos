LEFT = 0
RIGHT = 1
# Binary Tree Node
class BinNode
  include Comparable

  @children
  @value
  @parent
  attr_reader :value
  attr_reader :children # for bfs
  attr_accessor :parent # for insert, needed by delete

  def initialize(value)
    @value = value
    @children = Array.new(2)
    @parent = nil
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

  def insert_child(index, node)
    if @children[index].nil?
      node.parent = self
      @children[index] = node
    else
      @children[index].insert(node)
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

  # REMEMBER: NOT RECURSIVE
  def bfs(value)
    q = Array.new()
    q.push(self)

    until q.empty?
      node = q.shift
      puts "#{node.value}"
      if node.value == value
        puts "Found #{value}" #Could return here if needed
        return node
      end

      node.children.each do |child|
        unless child.nil?
          q.push(child)
        end
      end
    end
  end

  # This isn't correct, need to visit every node
  def height(level = 1)
    if @children[LEFT] != nil
      return @children[LEFT].height(level + 1)
    elsif @children[RIGHT] != nil
      return @children[RIGHT].height(level + 1)
    end
  end

  def delete
    children = @children.select { |child| !child.nil? }

    if children.empty? # No children
      @parent.delete_child(self)
    end

    if children.count == 1 # One child. Replace self with child. Just using values here but who cares
      @value = children.first.value
      @children = Array.new(2)
    end

    if children.count == 2 # Two children. Need to replace self with left most value of right child
      succ = find_succ
      succ.parent.delete_child(succ)
      @value = succ.value
    end
  end

  def delete_child(node)
    @children = @children.select { |child| child != node }
  end

  def find_succ
    find_left_most(@children[RIGHT])
  end

  def find_left_most(node)
    return node if node.children[LEFT].nil?
    find_left_most(node.children[LEFT])
  end
end

root = BinNode.new(5)
root.insert(BinNode.new(4))
root.insert(BinNode.new(3))
root.insert(BinNode.new(7))
root.insert(BinNode.new(6))
root.insert(BinNode.new(9))
puts root
#puts root.traverse_tree
#puts root.dfs(9)
#puts root.dfs(3)
nine = root.bfs(9)
four = root.bfs(4)
#nine.delete
#four.delete
seven = root.bfs(7)
seven.delete
puts root

tree2 = BinNode.new(1)
tree2.insert(BinNode.new(2))
tree2.insert(BinNode.new(3))
tree2.insert(BinNode.new(4))
tree2.insert(BinNode.new(5))
#puts tree2

#puts tree2.traverse_tree
