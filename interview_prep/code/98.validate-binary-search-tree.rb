# Definition for a binary tree node.
# class TreeNode
#   attr_accessor :val, :left, :right
#   def initialize(val = 0, left = nil, right = nil)
#     @val = val
#     @left = left
#     @right = right
#   end
# end
# @param {TreeNode} root
# @return {Boolean}
def is_valid_bst(root, min = nil, max = nil)
  return true if root.nil?

  return false if root.val <= min if min
  return false if root.val >= max if max

  is_valid_bst(root.left, min, root.val) &&
    is_valid_bst(root.right, root.val, max)
end
