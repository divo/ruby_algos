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
# Walk list bulding array of nodes indexed by position
# Then use the array to update list
# This is the only way I can think to do it in one pass
# From the END of the list
def remove_nth_from_end(head, n)
  items = []
  current = head
  idx = 0

  until current.nil?
    items[idx] = current
    idx += 1
    current = current.next
  end

  return nil if items.length == 1
  return head if n > items.length

  item_index = items.length - n
  return head.next if item_index == 0

  items[item_index - 1].next = items[item_index].next
  head
end
