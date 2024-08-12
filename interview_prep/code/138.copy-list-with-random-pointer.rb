# Definition for Node.
# class Node
#     attr_accessor :val, :next, :random
#     def initialize(val = 0)
#         @val = val
#		  @next = nil
#		  @random = nil
#     end
# end

# @param {Node} node
# @return {Node}
def copyRandomList(head)
  # First build a copy of the list, while building a hash to store the random pointers
  result, random_map, old_list_map = copy_list(head)
  # Then do a second pass to update the 'random' pointers
  update_random_references(result, random_map, old_list_map)
end

def copy_list(head)
  result = Node.new(0)
  current = result
  random_map = {}
  old_list_map = {}

  while head
    current.next = Node.new(head.val)
    old_list_map[head] = current.next
    if head.random
      random_map[current.next] = head.random
    end
    head = head.next
    current = current.next
   end

  [result.next, random_map, old_list_map]
end

def update_random_references(head, random_map, old_list_map)
  current = head
  while current
    old_random = random_map[current]
    if old_random
      current.random = old_list_map[old_random]
    end
    current = current.next
  end
  head
end
