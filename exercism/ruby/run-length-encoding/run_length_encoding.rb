# TODO: Make this a module
class RunLengthEncoding
  class << self
    def encode(string)
      chunks = chunk_string(string) { |x, y| x == y }
      map(chunks, &:compress)
    end

    def decode(string)
      chunks = chunk_string(string) { |x, _| number?(x) }
      map(chunks, &:expand)
    end

    def compress(chunk)
      length = chunk.length > 1 ? chunk.length : nil
      "#{length}#{chunk.first}"
    end

    def expand(chunk)
      if chunk.length == 1
        chunk.pop
      else # chunk is a digit and character
        char = chunk.pop
        count = chunk.join.to_i
        char * count
      end
    end

    def number?(x)
      x == x.to_i.to_s
    end

    def chunk_string(string, &condition)
      string.chars.chunk_while(&condition)
    end

    def map(chunks)
      chunks.map { |chunk| yield(self, chunk) }.join
    end
  end
end
