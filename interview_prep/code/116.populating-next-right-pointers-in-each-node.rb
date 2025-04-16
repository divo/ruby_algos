def connect(root)
  # Build levels into Hash
  @levels = Hash.new { |h, k| h[k] = [] }
  build_levels(root, 0)

  # Walk levels, setting next to right node
  @levels.values.each do |level|
    prev = nil
    level.reverse_each do |node|
      node.next = prev
      prev = node
    end
  end

  root
end

def build_levels(node, level)
  return unless node

  build_levels(node.left, level + 1)
  @levels[level] << node
  build_levels(node.right, level + 1)
end

class Node
  def inspect
    @val.to_s
  end
end
