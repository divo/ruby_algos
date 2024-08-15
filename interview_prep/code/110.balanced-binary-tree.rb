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
# Depth of the two subtrees of every node cannot differ by more than one
def is_balanced(root)
  queue = [root]
  until queue.empty?
    node = queue.shift
    next unless node

    return false if (depth(node.right) - depth(node.left)).abs > 1

    queue << node.right << node.left
  end
  true
end

def depth(node, depth = 0)
  return depth unless node

  [depth(node.left, depth + 1), depth(node.right, depth + 1)].max
end
