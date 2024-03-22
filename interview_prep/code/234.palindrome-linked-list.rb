# Definition for singly-linked list.
 class ListNode
     attr_accessor :val, :next
     def initialize(val = 0, _next = nil)
         @val = val
         @next = _next
     end
 end
# @param {ListNode} head
# @return {Boolean}
# [1, 2, 2, 1]
# [1, 0, 1] Odd length sequences are also valid palindromes
# In this case I need the length of the list....
# Easy way find the length and skip the middle element
def is_palindrome(head)
  # Walk the list building a stack, push item if not equal to head of stack
  # pop item if it is the head of the stack
  # return stack length == 0
  return true if head && !head.next

  length = list_length(head)

  stack = []
  middle = length / 2 # Integer division will remove middle from odd length list
  middle.times do
    stack << head.val
    head = head.next
  end

  while head
    if head.val == stack.last
      stack.pop
    end
    head = head.next
  end

  return stack.length.zero?
end

def list_length(head)
  result = 0
  while head
    result += 1
    head = head.next
  end

  return result
end

