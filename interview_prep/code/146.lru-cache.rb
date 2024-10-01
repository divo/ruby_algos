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
    node.value
  end

  # =begin
  #     :type key: Integer
  #     :type value: Integer
  #     :rtype: Void
  # =end
  def put(key, value)
    # evict the tail if we need to insert a new node
    evict if @index.size == @capacity && !@index[key]

    node = @index[key] || ListNode.new(key: key, val: value)
    node.value = value
    move_to_head(node)
    @index[key] = node
  end

  private

  def evict
    @index.delete(@tail.key)

    if @head == @tail
      @head = nil
      @tail = nil
      return
    end

    @tail.prev.next = nil
    prev = @tail.prev
    @tail.prev = nil
    @tail = prev
  end

  # 1 <-> 2 <-> 3
  def move_to_head(node)
    return if @head == node

    # Handle first node added to cache
    unless @head
      @tail = @head = node
      return
    end

    @tail = @tail.prev if node == @tail # Update tail reference if moving tail

    # Move the node out of its position in the list
    node.prev&.next = node.next
    node.next&.prev = node.prev

    # Update the head reference
    node.next = @head
    @head.prev = node
    @head = node
  end
end
