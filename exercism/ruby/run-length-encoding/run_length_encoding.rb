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
      # Chunk into nos and chars, then each_cons it
      chunks = string.chars.chunk { |x| number?(x) }
      require 'byebug'; byebug;
    end

    def number?(x)
      x == x.to_i.to_s
    end
  end
end
