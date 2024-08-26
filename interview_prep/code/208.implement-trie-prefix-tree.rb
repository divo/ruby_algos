class Trie
  attr_accessor :value, :nodes

  def initialize
    @nodes = Array.new(26)
    self.value = nil
  end

  def insert(word)
    current = self
    word.chars.each do |c|
      current.nodes[c_to_idx(c)] = Trie.new if current.nodes[c_to_idx(c)].nil?
      current = current.nodes[c_to_idx(c)]
    end
    current.value = word
  end

  def search(word)
    current = self
    word.chars.each do |c|
      current = current.nodes[c_to_idx(c)]
      return false if current.nil?
    end
    current.value == word
  end

  def starts_with(prefix)
    current = self
    prefix.chars.each do |c|
      current = current.nodes[c_to_idx(c)]
      return false if current.nil?
    end
    true
  end

  private

  def c_to_idx(c)
    c.ord - 97
  end
end

# Your Trie object will be instantiated and called as such:
# obj = Trie.new()
# obj.insert(word)
# param_2 = obj.search(word)
# param_3 = obj.starts_with(prefix)
