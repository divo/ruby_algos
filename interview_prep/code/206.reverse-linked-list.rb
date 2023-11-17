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
def reverse_list(head)
  do_reverse(head, nil)
end

def do_reverse(head, prev)
  return prev unless head
  n_node = head.next
  head.next = prev
  do_reverse(n_node, head)
end

def reverse_list_iterative(head)
  prev = nil
  while head
    n_node = head.next
    head.next = prev
    prev = head
    head = n_node
  end
  prev
end
