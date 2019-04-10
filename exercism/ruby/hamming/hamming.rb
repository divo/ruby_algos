class Hamming
  def self.compute(first, second)
    raise ArgumentError unless first.length == second.length

    pairs = first.chars.zip(second.chars)
    pairs.count { |l, r| r != l }
  end
end
