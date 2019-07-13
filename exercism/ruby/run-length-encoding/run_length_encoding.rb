class RunLengthEncoding
  class << self
    def encode(string)
      return '' if string.empty?
      groups = string.chars.chunk_while { |x, y| x == y }
      result = groups.map do |group|
        length = group.length > 1 ? group.length : nil
        "#{length}#{group.first}"
      end
      result.join
    end
  end
end
