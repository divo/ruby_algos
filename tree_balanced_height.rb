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
def is_balanced(root)
  return true unless root
  
  left = height root.left
  right = height root.right
  (left - right).abs <= 1 && is_balanced(root.left) && is_balanced(root.right) #Checking recursivly for the balance of subtrees is the key take away here
end

def height(node, acc=0)
  return acc unless node
  acc += 1
  left = height(node.left, acc)
  right = height(node.right, acc)
  [left, right].max
end

