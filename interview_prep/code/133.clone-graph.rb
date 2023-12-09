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
  queue = [[node, nil]]
  result = nil
  visited = {}
  until queue.empty?
    current, parent = queue.shift
    next if visited[current] || current.nil?

    n_node = Node.new(current.val)
    result ||= n_node

    parent.neighbors << n_node if parent
    n_node.neighbors << parent if parent

    current.neighbors.each { |n| queue << [n, n_node] }
    visited[current] = true
  end
  result
end
