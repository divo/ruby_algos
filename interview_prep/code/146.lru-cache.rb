# frozen_string_literal: true

class ListNode
  attr_accessor :key, :value, :next, :prev

  def initialize(key: nil, val: 0, nxt: nil, prev: nil)
    @key = key
    @value = val
    @next = nxt
    @prev = prev
  end
end

# LRUCache
class LRUCache
  # =begin
  #     :type capacity: Integer
  # =end

  def initialize(capacity)
    @index = {}
    @head = nil
    @tail = nil
    @capacity = capacity
  end

  # =begin
  #     :type key: Integer
  #     :rtype: Integer
  # =end
  def get(key)
    # If node exists, move it to the head and return the value
    node = @index[key]
    return -1 unless node

    move_to_head(node)
    return node.value
  end

  # =begin
  #     :type key: Integer
  #     :type value: Integer
  #     :rtype: Void
  # =end
  def put(key, value)
    # If key already present, update it and move node to head of list
    node = @index[key]
    if node
      node.value = value
      move_to_head(node)
    else
      # If we are over capacity, first evict the tail
      evict if @index.size == @capacity
      node = ListNode.new(key: key, val: value)
      move_to_head(node)
      @index[key] = node
    end
  end

  def evict
    @index.delete(@tail.key)
    if @head == @tail
      @head = nil
      @tail = nil
      return
    end

    @tail.prev&.next = nil # Safe access to handle capacity == 1
    prev = @tail.prev
    @tail.prev = nil
    @tail = prev
  end

  # 1 <-> 2 <-> 3
  def move_to_head(node)
    # Handle first node added
    unless @head
      @head = node
      @tail = node
      return
    end
    
    return if @head == node

    @tail = @tail.prev if node == @tail
    node.prev&.next = node.next
    node.next&.prev = node.prev

    node.next = @head
    node.prev = nil
    @head.prev = node
    @head = node
  end
end

# Your LRUCache object will be instantiated and called as such:
obj = LRUCache.new(1)
puts obj.get(6) # -1
puts obj.get(8) # -1
obj.put(12, 1)
puts obj.get(2) # -1
obj.put(15, 11)
obj.put(5, 2)
obj.put(1, 15)
obj.put(4, 2)
puts obj.get(5) # -1
obj.put(15, 15)
