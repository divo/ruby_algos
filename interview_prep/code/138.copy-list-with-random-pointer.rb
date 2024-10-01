# Definition for Node.
 class Node
     attr_accessor :val, :next, :random
     def initialize(val = 0, _next = nil)
         @val = val
		     @next = _next
		     @random = nil
     end
 end

class Node
  include Enumerable

  def each(&block)
    head = self
    while head
      block.call(head)
      head = head.next
    end
    self
  end
end

# @param {Node} node
# @return {Node}
def copyRandomList(head)
  # First build a copy of the list, while building a hash to store the random pointers
  result, random_map, old_list_map = copy_list(head)
  # Then do a second pass to update the 'random' pointers
  update_random_references(result, random_map, old_list_map)
end

def copy_list(head)
  current = result = Node.new(0)
  random_map, old_list_map = {}, {}

  head.each do |node|
    current.next = Node.new(node.val)
    old_list_map[node] = current.next
    random_map[current.next] = node.random # Can store nil if random not set 
    current = current.next
  end

  [result.next, random_map, old_list_map]
end

def update_random_references(head, random_map, old_list_map)
  head.each do |current|
    current.random = old_list_map[random_map[current]]
  end
end
