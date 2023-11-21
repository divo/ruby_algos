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
def is_valid_bst(root, min = nil, max = nil)
  return true if root.nil?

end

def is_valid_bst(node, left = nil, right = nil)
  return true if node.nil?

  return false if left && node.val <= left
  return false if right && node.val >= right

  is_valid_bst(node.left, left, node.val) &&
    is_valid_bst(node.right, node.val, right)
end
