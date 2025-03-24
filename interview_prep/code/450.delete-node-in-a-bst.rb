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
# @param {Integer} key
# @return {TreeNode}
def delete_node(_root, _key)
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
  # @param {Integer} key
  # @return {TreeNode}
  def delete_node(root, key)
    return unless root # Handle empty tree

    # Walk left or right until you find the node to delete
    root.right = delete_node(root.right, key) if key > root.val
    root.left = delete_node(root.left, key) if key < root.val

    if key == root.val
      # Return the left / right subtree if there is no right / left subtree.
      # If there is only one branch we only have to move it up one node
      return root.right unless root.left
      return root.left unless root.right

      # If there is a tree to deal with, find the left most (smallest) value of the
      # RIGHT subtree and replace the node to deletes value with it
      root.val = min_value(root.right)
      # Walk down the rest of the right branch, moving the nodes up to replace the
      # node you moved up
      root.right = delete_node(root.right, root.val)
    end

    # Return root if as the base case
    root
  end

  def min_value(node)
    current = node
    current = current.left while current.left
    current.val
  end

  def delete_node_wrong(root, key)
    return [] unless root

    return [] if !root.left && !root.right && key == root.val

    @parents = []
    @parents[root.val] = nil

    node = find(key, root)
    return root unless node

    if node == root
      root = delete_root(root)
    else
      delete(node, root)
    end
    root
  end

  def find(key, root, parent = nil)
    return unless root

    @parents[root.val] = parent

    return root if key == root.val

    left = find(key, root.left, root)
    return left if left

    right = find(key, root.right, root)
    right if right
  end

  def delete(node, _root)
    parent = @parents[node.val]
    replacement_node = find_leftmost(node.right) || node
    if replacement_node == node
      parent.right = nil
      return
    end

    if parent
      if parent.left == node
        parent.left = replacement_node
      else
        parent.right = replacement_node
      end
    end
    replacement_node.left = node.left
  end

  def delete_root(root)
    old_root = root
    root = root.right
    root.left = old_root.left
    root
  end

  def find_leftmost(node)
    return node unless node&.left

    find_leftmost(node.left)
  end
end
