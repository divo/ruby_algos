class Node
  attr_accessor :succ
  @value

  def initialize(value)
    @value = value
    @succ = nil
  end

  def to_s
    @next = @succ.nil? ? " :END:" : succ.to_s
    "#{@value} -> #{@next}"
  end

  def find(value)
    if value == @value
      return self
    elsif @succ != nil
      return @succ.find(value)
    else
      return nil
    end
  end

  def insert(node)
    old_succ = @succ
    @succ = node
    node.succ = old_succ
  end

end

head = Node.new(1)
puts head.to_s
head.insert(Node.new(2))
puts head.to_s




