# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Integer[]}
def right_side_view(root)
  return [] unless root

  levels = Hash.new { |h, k| h[k] = [] } 
  map_levels(root, levels)
  levels.map { |_, values| values.last }
end

def map_levels(node, levels, level = 0)
  return unless node

  levels[level] << node.val
  map_levels(node.left, levels, level + 1)
  map_levels(node.right, levels, level + 1)
end