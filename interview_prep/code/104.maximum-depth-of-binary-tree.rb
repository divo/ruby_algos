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
def max_depth_recursive(root, count = 0)
  # Use DFS to travel down, couting 
  # Take the max of the final counts
  return count unless root

  [max_depth(root.left, count + 1), max_depth(root.right, count + 1)].max
end

def max_depth(root)
  max = 0
  stack = [[root, 1]]
  until stack.empty? do
    node, depth = stack.pop
    next unless node

    max = [max, depth].max
    stack.push [node.left, depth + 1]
    stack.push [node.right, depth + 1]
  end

  max
end
