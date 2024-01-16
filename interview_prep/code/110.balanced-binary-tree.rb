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
  # The height of two subtrees never differ by more than one.
  # Use DFS to walk down the tree, at each step increment the current height
  # If the height of left and right branches differ by > 1 then return -1,
  # otherwise return the height
  return true unless root

  height(root) >= 0
end

def height(root, depth = 0)
  return depth unless root

  left_h = height(root.left, depth + 1)
  right_h = height(root.right, depth + 1)

  return -1 if (left_h - right_h).abs > 1

  [left_h, right_h].max
end
