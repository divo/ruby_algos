# TODO: Make this a module
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

    def decode(string)
      chunks = string.chars.chunk_while { |x, _| number?(x) }
      # TODO: Clean this up
      result = chunks.map do |chunk|
        char = chunk.pop
        count = chunk.join.to_i
        char * count
      end
      result.join
    end

    def number?(x)
      x == x.to_i.to_s
    end
  end
end
