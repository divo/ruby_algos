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
  # Build a list of clones & neighbors
  return unless node

  clones = []
  neighbors = []
  queue = [node]

  until queue.empty?
    current = queue.shift
    next if clones[current.val - 1]

    clones[current.val - 1] = Node.new(current.val)

    current.neighbors.each do |n|
      queue.unshift(n)
      (neighbors[current.val - 1] ||= []) << n.val
    end
  end

  # Walk the neighbors re-linking the clones
  neighbors.each_with_index do |neighbor_row, parent_index|
    clones[parent_index].neighbors = neighbor_row.map { |neighbor_index| clones[neighbor_index - 1] }
  end

  clones.first
end

class Node
  def inspect
    "val : #{val} -> #{neighbors.map(&:val)}"
  end
end
