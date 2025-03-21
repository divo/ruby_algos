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
def good_nodes(root)
  # DFS the tree and keep track of the max value seen in path.
  # If node >= max value, it is a good node
  @result = 0
  dfs(root, root.val)
  @result
end

def dfs(node, max)
  return unless node

  @result += 1 if node.val >= max
  max = [node.val, max].max
  dfs(node.left, max)
  dfs(node.right, max)
end

