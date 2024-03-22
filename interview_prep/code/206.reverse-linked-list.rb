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
# head 3
# ref 3
# next 1
# tail 2
def reverse_list(head)
  tail = nil
  h_next = nil
  while head
    h_next = head.next
    head.next = tail
    tail = head
    head = h_next
  end
   
  tail
end
