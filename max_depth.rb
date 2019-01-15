def max_depth(root)
  return 0 if root.nil?
  _max_depth(root, 1)
end

def _max_depth(node, depth)
  left = node.left.nil? ? depth : _max_depth(node.left, depth + 1)
  right = node.right.nil? ? depth : _max_depth(node.right, depth + 1)
  left > right ? left : right
end
