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
# @param {Integer} k
# @return {Integer}
def kth_smallest(root, k)
  values = []
  in_order(root, values)

  values[k - 1]
end

def in_order(node, values)
  return unless node

  in_order(node.left, values)
  values << node.val
  in_order(node.right, values)
end

def kth_smallest_way_overcomplicated(root, k)
  pivot = 0
  values = [root.val]
  stack = [[root, pivot]]
  until stack.empty?
    node, p = stack.pop
    next unless node

    if node.right
      values.insert(p + 1, node.right.val)
      stack << [node.right, p + 1]
    end

    if node.left
      values.insert(p, node.left.val)
      stack << [node.left, p]
    end
  end
  
  values[k - 1]
end


def kth_smallest_sorting(root, k)
  values = []
  queue = [root]
  until queue.empty?
    node = queue.pop
    next if node.nil?

    values << node.val

    queue << node.left
    queue << node.right
  end

  values.sort[k - 1]
end
