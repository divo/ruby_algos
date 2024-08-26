class Trie
  attr_accessor :value, :nodes

  def initialize
    @nodes = Array.new(26)
    self.value = nil
  end

  def insert(word)
    # Decend the tree, creating a node for each character in the input
    # The final leaf node contains the complete string
    current = self
    word.chars.each do |c|
      current.nodes[c_to_idx(c)] = Trie.new if current.nodes[c_to_idx(c)].nil?
      current = current.nodes[c_to_idx(c)]
    end
    current.value = word
  end

  def search(word)
    # Decend the tree, if we arrive at a node with the input
    # set as value, then the Trie contains that word
    current = self
    word.chars.each do |c|
      current = current.nodes[c_to_idx(c)]
      return false if current.nil?
    end
    current.value == word
  end

  def starts_with(prefix)
    # Much the same as search, but we don't need the
    # Trie to contain the word, just it's characters
    current = self
    prefix.chars.each do |c|
      current = current.nodes[c_to_idx(c)]
      return false if current.nil?
    end
    true
  end

  private

  # Convert a character to int
  # For using ASCII chars as array index, i.e. a = 0, z = 25
  def c_to_idx(c)
    c.ord - 97
  end
end

# Your Trie object will be instantiated and called as such:
# obj = Trie.new()
# obj.insert(word)
# param_2 = obj.search(word)
# param_3 = obj.starts_with(prefix)
