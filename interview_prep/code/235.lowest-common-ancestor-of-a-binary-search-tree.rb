# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

def lowest_common_ancestor(root, p, q)
  # If p and q are both less than the root, decend left
  return lowest_common_ancestor(root.left, p, q) if p.val < root.val && q.val < root.val
  # If p and q are both less than the root, decend right
  return lowest_common_ancestor(root.right, p, q) if p.val > root.val && q.val > root.val

  # if p < root < q then you are at the split point, the LCA
  root
end

# @param {TreeNode} root
# @param {TreeNode} p
# @param {TreeNode} q
# areturn {TreeNode}
def lowest_common_ancestor_slow(root, p, q)
  p_path = build_path(root, p)
  q_path = build_path(root, q)

  return nil unless p_path && q_path

  min = root
  paths = []
  p_path.each_with_index do |val, idx|
    paths << [val, q_path[idx]] # Building pairs out of path nodes
  end

  paths.each do |l, r|
    min = l if l&.val == r&.val
  end
  min
end

def build_path(root, node)
  path = [root]
  loop do
    p = path.last
    return nil unless p

    if p.val == node.val
      return path
    elsif node.val < p.val
      path << p.left
    else
      path << p.right
    end
  end
end

tree = TreeNode.new(6)
tree.left = TreeNode.new(2)
tree.left.left = TreeNode.new(0)
tree.left.right = TreeNode.new(4)
tree.right = TreeNode.new(8)
