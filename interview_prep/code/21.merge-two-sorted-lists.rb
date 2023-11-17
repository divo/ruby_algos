# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end
# @param {ListNode} list1
# @param {ListNode} list2
# @return {ListNode}
# Input: list1 = [1,2,4], list2 = [1,3,4]
# Output: [1,1,2,3,4,4]
# Result: [nil, 1, 1, 2, 3, 4]
def merge_two_lists(left, right)
  return left unless right
  return right unless left

  result = ListNode.new
  head = result
  while !left.nil? && !right.nil?
    if left.val < right.val
      head.next = left
      left = left.next
    else
      head.next = right
      right = right.next
    end
    head = head.next
  end

  if left.nil?
    head.next = right
  elsif right.nil?
    head.next = left
  end

  result.next
end
