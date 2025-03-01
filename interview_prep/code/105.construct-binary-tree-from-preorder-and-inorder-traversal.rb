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
  root = TreeNode.new(preorder.first)
  return root if preorder.length <= 1

  preorder[1..].each { |x| insert(root, x, preorder, inorder) }
  root
end

def insert(root, val, preorder, inorder)
  if inorder.index(val) < inorder.index(root.val)
    if root.left.nil?
      root.left = TreeNode.new(val)
    else
      insert(root.left, val, preorder, inorder)
    end
  elsif root.right.nil?
    root.right = TreeNode.new(val)
  else
    insert(root.right, val, preorder, inorder)
  end
end
