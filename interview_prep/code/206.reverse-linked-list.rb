# Definition for singly-linked list.
# class ListNode
#   attr_accessor :val, :next
#   def initialize(val = 0, _next = nil)
#     @val = val
#     @next = _next
#   end
# end
# @param {ListNode} head
# @return {ListNode}
# 3 -> 4 -> 5
# [1, 2, 3, 4, 5]
# []
# Navigate down the list setting next to the previous element
def reverse_list(head)
  prev = nil
  while head != nil
    nxt = head.next
    head.next = prev
    prev = head
    head = nxt
  end
  prev
end
