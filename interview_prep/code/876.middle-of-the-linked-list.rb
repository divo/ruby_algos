# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {ListNode}
def middle_node(head)
  count = 1
  node_hash = {}
  until head.nil?
    node_hash[count] = head
    count += 1
    head = head.next
  end

  node_hash[(node_hash.count / 2) + 1]
end
