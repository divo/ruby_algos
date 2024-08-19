# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode[]} lists
# @return {ListNode}
def merge_k_lists(lists)
  # Filter empty input or lists of single items
  return nil if lists.empty? || (lists.first&.val.nil? && lists.length == 1)

  return lists.first if lists.length == 1

  current = result = ListNode.new
  until lists.empty?
    min = [Integer::MAX, -1] # Store tuple of node and index

    # Find the list with the smallest head
    lists.each_with_index do |node, index|
      min = [[node&.val || Integer::MAX, index], min].min_by(&:first)
    end

    min_val, min_index = min
    if min_val != Integer::MAX # Handle not finding a min, when we have junk input
      # Take the head of that list and add it to the result
      current.next = ListNode.new(min_val)
      current = current.next
    end

    # Remove the node we just took from it's list
    lists[min_index] = lists[min_index]&.next
    lists = lists.compact
  end

  result.next
end

class Integer
  N_BYTES = [42].pack('i').size
  N_BITS = N_BYTES * 16
  MAX = 2**(N_BITS - 2) - 1
  MIN = -MAX - 1
end
