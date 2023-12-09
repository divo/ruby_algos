# Definition for a Node.
# class Node
#     attr_accessor :val, :neighbors
#     def initialize(val = 0, neighbors = nil)
#		  @val = val
#		  neighbors = [] if neighbors.nil?
#         @neighbors = neighbors
#     end
# end

# @param {Node} node
# @return {Node}
def cloneGraph(node)
  df_clone(node, {})
end

def df_clone(node, clones)
  return unless node
  return clones[node] if clones.key?(node)

  new_node = Node.new(node.val)
  clones[node] = new_node

  node.neighbors.each do |n|
    new_node.neighbors << df_clone(n, clones)
  end

  new_node
end

