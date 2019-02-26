# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Boolean}
def is_unival_tree(root)
  check_tree(root, root.val)
end

def check_tree(node, val)
  return true unless node
  node.val == val && check_tree(node.left, val) && check_tree(node.right, val)
end
