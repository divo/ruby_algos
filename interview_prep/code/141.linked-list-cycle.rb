# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {Boolean}
def hasCycle(head)
  fast = head
  while head && fast
    fast = fast.next
    return false unless fast

    head = head.next
    fast = fast.next

    return true if fast == head
  end
  false
end

def hasCycleHash(head)
  seen = {}
  until head.nil?
    return true if seen[head]
    seen[head] = true
    head = head.next
  end

  false
end
