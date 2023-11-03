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
# @return {TreeNode}
# [2, 1, 3]
def invert_tree(root)
  return unless root

  invert_tree(root.left)
  invert_tree(root.right)

  root.left, root.right = root.right, root.left
  root
end

def invert_tree_crap(root)
  left, right = root&.left, root&.right
  if left && right
    root.left = right
    root.right = left
  end

  invert_tree(left) if left
  invert_tree(right) if right

  root
end
