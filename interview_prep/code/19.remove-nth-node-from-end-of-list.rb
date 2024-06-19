# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
class ListNode
  include Enumerable

  def each(&block)
    block.call(self)
    @next&.each(&block)
  end
end

def remove_nth_from_end(head, n)
  items = list_to_array(head)

  return nil if items.length == 1
  return head if n > items.length
  return head.next if n == items.length

  item_index = items.length - n
  items[item_index - 1].next = items[item_index].next
  head
end

def list_to_array(head)
  head.reduce([]) { |arr, node| arr << node }
end
