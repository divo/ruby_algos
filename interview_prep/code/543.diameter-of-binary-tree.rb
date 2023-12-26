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
# @return {Integer}
def diameter_of_binary_tree(root)
  # Need to find the depth of every left/right subtree and take the max pair
  queue = [root]
  result = []
  until queue.empty?
    node = queue.pop
    result << tree_depth(node)
    queue << node.left unless node.left.nil?
    queue << node.right unless node.right.nil?
  end
  result.max
end

def tree_depth(root)
  depth(root.left, 1) + depth(root.right, 1)
end

def depth(node, depth)
  return depth - 1 if node.nil?

  [depth(node.left, depth + 1), depth(node.right, depth + 1)].max
end
