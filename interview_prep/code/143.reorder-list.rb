# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end
# @param {ListNode} head
# @return {Void} Do not return anything, modify head in-place instead.
def reorder_list(head)
  list, r_list = [], [] # I don't need two lists! I can just build one and then pop and shift from the same list
  current = head
  until current.nil?
    list.push current
    r_list.unshift current
    current = current.next
  end

  head = list.shift
  current = head
  (1..list.length).each do |i|
    if i.even?
      current.next = list.shift
      current = current.next
    else
      current.next = r_list.shift
      current = current.next
    end
  end
  current.next = nil
end
