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
  stack = [[p, q]]
  until stack.empty? do
    l, r = stack.pop
    return false if l&.val != r&.val

    stack.push [l.left, r.left] if l
    stack.push [l.right, r.right] if r
  end
end

def is_same_tree_recursive(p, q)
  return true if p.nil? && q.nil?

  return false if p&.val != q&.val

  is_same_tree(p.left, q.left) && is_same_tree(p.right, q.right)
end
