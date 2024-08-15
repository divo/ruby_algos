# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} p
# @param {TreeNode} q
# @return {Boolean}
def is_same_tree(p, q)
  queue = [[p, q]]
  until queue.empty?
    l, r = queue.shift
    next if l.nil? && r.nil?

    return false unless l&.val == r&.val

    queue << [l&.left, r&.left] << [l&.right, r&.right]
  end

  true
end

def is_same_tree_recursive(p, q)
  return true if p.nil? && q.nil?

  return false unless p&.val == q&.val

  is_same_tree_recursive(p.left, q.left) && is_same_tree_recursive(p.right, q.right)
end
