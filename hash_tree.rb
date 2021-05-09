# Method to covnert array to nested hash
# the block allows you to pass something in to get stored in the leaf nodes
#
# use active support deep_merge to turn a load of these into a hash tree
# you can easily walk down

class Array
  def to_h(&block)
    head, *tail = self
    if tail.empty?
      { head => block_given? ? yield : nil }
    else
      { head => tail.to_h(&block) }
    end
  end
end
