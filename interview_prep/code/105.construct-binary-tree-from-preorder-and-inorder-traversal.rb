# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {Integer[]} preorder
# @param {Integer[]} inorder
# @return {TreeNode}
def build_tree(preorder, inorder)
  result = current = next_node = TreeNode.new

  preorder.each_with_index do |val, index|
    next_node.val = val
    if index != preorder.length - 1
      if current.val != inorder[index]
        next_node.left = TreeNode.new
        next_node = next_node.left
      else
        current.right = TreeNode.new
        next_node = current.right
        current = current.right
      end
    end
  end

  result
end
