class RunLengthEncoding
  class << self
    def encode(string)
      return '' if string.empty?
      groups = string.chars.chunk_while { |x, y| x == y }
      groups.map { |group| "#{group.length}#{group.first}" }.join
    end
  end
end
