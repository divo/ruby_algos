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
# @return {Boolean}
def is_balanced(root)
  # Balanced binary tree is one where the depth of the two subtrees of every 
  # node differs by no more than 1
  balanced_height(root, 0) >= 0
end

def balanced_height(node, depth)
  return depth unless node

  l = balanced_height(node.left, depth + 1)
  r = balanced_height(node.right, depth + 1)

  return -1 if (l - r).abs > 1

  [l, r].max
end
