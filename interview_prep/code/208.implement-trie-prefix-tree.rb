# Simple prefix tre# Simple prefix tre# Simple prefix tree
class Trie
  attr_reader :nodes
  attr_accessor :value

  def initialize
    @nodes = Array.new(26)
    @value = value
  end

  def insert(word)
    current = self
    word.chars.each do |c|
      current.nodes[c.to_ord_idx] = Trie.new unless current.nodes[c.to_ord_idx]
      current = current.nodes[c.to_ord_idx]
    end

    current.value = word
  end

  def search(word)
    current = self
    word.chars.each do |c|
      current = current.nodes[c.to_ord_idx]
      return false unless current
    end

    current.value == word
  end

  def starts_with(prefix)
    current = self
    prefix.chars.each do |c|
      current = current.nodes[c.to_ord_idx]
      return false unless current
    end

    true
  end
end

class String
  def to_ord_idx
    ord - 97
  end
end

# Your Trie object will be instantiated and called as such:
# obj = Trie.new()
# obj.insert(word)
# param_2 = obj.search(word)
# param_3 = obj.starts_with(prefix)
