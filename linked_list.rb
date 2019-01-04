class Node
  attr_accessor :succ
  @value

  def initialize(value)
    @value = value
    @succ = nil
  end

  def print_list
    @next = @succ.nil? ? " :END:" : succ.print_list
    "#{@value} -> #{@next}"
  end

  def to_s
    "#{@value}"
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
    unless self.succ == nil
      return self.succ.insert(node)
    end
    old_succ = @succ
    @succ = node
    node.succ = old_succ
  end

  def self.delete(head, node)
    if head == node
      return head.succ
    end

    if p = Node.find_prev(head, node)
      p.succ = node.succ
    end
    return head
  end

  def self.find_prev(head, node)
    # Can't have a previous || not found
    if head == node || node == nil
      return nil
    end

    if head.succ == node
      return head
    end

    return Node.find_prev(head.succ, node)
  end
end

head = Node.new(1)
puts head.print_list
two = Node.new(2)
head.insert(two)
puts head.print_list
puts head.find 2
five = Node.new(5)
head.insert(five)
puts head.print_list
puts Node.find_prev(head, five)
head = Node.delete(head, head)
puts head.print_list

