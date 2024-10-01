# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
  carry = 0
  result = ListNode.new
  current = result

  until l1.nil? && l2.nil? && carry.zero?
    sum = (l1&.val || 0) + (l2&.val || 0) + carry
    carry = sum / 10
    sum = sum % 10
    current.next = ListNode.new(sum)
    current = current.next
    l1 = l1&.next
    l2 = l2&.next
  end

  result.next
end
