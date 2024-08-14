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
  result = 0
  queue = [root]
  until queue.empty?
    node = queue.shift

    result = [result, node_diameter(node)].max
    queue << node.left unless node.left.nil?
    queue << node.right unless node.right.nil?
  end

  result
end

def node_diameter(root)
  height_of_tree(root.right) + height_of_tree(root.left)
end

def height_of_tree(root, height = 0)
  return height unless root

  [height_of_tree(root.left, height + 1), height_of_tree(root.right, height + 1)].max
end
