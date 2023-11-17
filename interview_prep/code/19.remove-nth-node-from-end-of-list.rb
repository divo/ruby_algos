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
# Input: head = [1,2,3,4,5], n = 2
# [1]
# s: 5
# n: 2
def remove_nth_from_end(head, n)
  return head unless head

  current = head
  size = 0
  until current.nil?
    size += 1
    current = current.next
  end

  return head.next if size - n == 0 # This is the bit I didn't get

  current = head
  prev = head
  (0..size - n).each do |i|
    if i == size - n
      prev.next = current&.next
    else
      prev = current
      current = current.next
    end
  end
  head
end
