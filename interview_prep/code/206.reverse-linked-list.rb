# Definition for singly-linked list.
 class ListNode
   attr_accessor :val, :next
   def initialize(val = 0, _next = nil)
     @val = val
     @next = _next
   end

   def inspect
     "#{@val} -> #{@next || "nil"}"
   end

   def to_s
     inspect
   end
 end
# @param {ListNode} head
# @return {ListNode}
# 3 -> 4 -> 5
# [1, 2, 3, 4, 5]
# []
# Navigate down the list setting next to the previous element
def reverse_list(head)
  do_reverse(head, nil)
end

def do_reverse(head, prev)
  return prev unless head

  n_node, head.next = head.next, prev
  do_reverse(n_node, head)
end

def reverse_list_iterative(head)
  prev = nil
  while head
    head.next, prev, head = prev, head, head.next
  end
  prev
end

list = ListNode.new(1, ListNode.new(2, ListNode.new(3)))
puts list
puts(list = reverse_list_iterative(list))
puts(reverse_list_iterative(list))
