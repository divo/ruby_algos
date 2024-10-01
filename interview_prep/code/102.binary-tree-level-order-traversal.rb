# Definition for a binary tree node.
# class TreeNode
#   attr_accessor :val, :left, :right
#   def initialize(val = 0, left = nil, right = nil)
#     @val = val
#     @left = left
#     @right = right
#   end
# end
# @param {TreeNode} root
# @return {Integer[][]}
# Redo for practise, came up with a cleaner solution
def level_order(root)
  # Use DFS to build a map indexed by level
  map = Hash.new { |h, k| h[k] = [] }
  dfs_index(root, 0, map)
  map.values
end

def dfs_index(root, level, map)
  return unless root

  map[level] << root.val
  dfs_index(root.left, level + 1, map)
  dfs_index(root.right, level + 1, map)
end

def level_order_first_attempt(root)
  return [] unless root

  result = [[root]]
  loop do
    nodes = result.last
    level = nodes.each_with_object([]) do |node, acc|
      acc << node.left if node&.left
      acc << node.right if node&.right
    end
    return level_values(result) if level.empty?

    result << level
  end
end

def level_values(levels)
  levels.map do |level|
    level.map { |node| node&.val }
  end
end
