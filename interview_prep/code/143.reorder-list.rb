# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end
# [1, 5, 2, 4, 3]
# @param {ListNode} head
# @return {Void} Do not return anything, modify head in-place instead.
def reorder_list(head)
  stack = list_to_stack(head)
  stack = stack.reverse[0...stack.length / 2]
  current = head
  until stack.empty?
    nxt = current.next
    tail = stack.shift
    current.next = tail
    tail.next = nxt
    current = nxt
  end

  current.next = nil
  head
end

def list_to_stack(head)
  result = []
  until head.nil?
    result << head
    head = head.next
  end
  result
end

# ll = ListNode.new(1, ListNode.new(2, ListNode.new(3, ListNode.new(4, ListNode.new(5)))))
