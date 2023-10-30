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
def merge_two_lists(list1, list2)
  return list2 unless list1
  return list1 unless list2

  result = ListNode.new
  current = result
  while !list1.nil? && !list2.nil?
    if list1.val < list2.val
      current.next = ListNode.new(list1.val)
      list1 = list1.next
    else
      current.next = ListNode.new(list2.val)
      list2 = list2.next
    end
    current = current.next
  end

  if list1.nil?
    current.next = list2
  elsif list2.nil?
    current.next = list1
  end

  result.next
end

l = ListNode.new(1)
r = ListNode.new(1)
[2, 4].reduce(l) { |list, x| list.next = ListNode.new(x); list.next }
[3, 4].reduce(r) { |list, x| list.next = ListNode.new(x); list.next }

# puts merge_two_lists(l, r)
