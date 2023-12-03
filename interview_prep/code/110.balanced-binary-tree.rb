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
  queue = [[root, 1]]
  max = nil
  until queue.empty?
    node, depth = queue.shift
    max = depth unless node
    return false if max && depth > max + 1 # Allowed a difference of 1

    queue << [node&.left, depth + 1]
    queue << [node&.right, depth + 1]
  end

  true
end
