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
  return true unless root
    
  queue = [[root, 1]]
  max = nil
  until queue.empty?
    node, depth = queue.shift
    max ||= depth unless node&.left && node&.right

    return false if max && depth > max + 1 # Allowed a difference of 1

    queue << [node.left, depth + 1] if node.left
    queue << [node.right, depth + 1] if node.right
  end

  true
end
