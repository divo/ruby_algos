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
# @param {TreeNode} sub_root
# @return {Boolean}
def is_subtree(root, sub_root)
  stack = [root]
  until stack.empty?
    n = stack.pop
    return true if is_equal_tree(n, sub_root)

    stack << n.left if n
    stack << n.right if n
  end

  false
end

def is_equal_tree(p, q)
  stack = [[p, q]]
  until stack.empty?
    l, r = stack.pop
    return false if l&.val != r&.val

    stack.push [l.left, r.left] if l
    stack.push [l.right, r.right] if l
  end
  true
end
