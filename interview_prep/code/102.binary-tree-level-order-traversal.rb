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
def level_order(root)
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
