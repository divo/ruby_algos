class Hamming
  def self.compute(first, second)
    raise ArgumentError unless first.length == second.length

    pairs = first.chars.zip(second.chars)
    pairs.inject(0) do |count, (left, right)|
      left != right ? count + 1 : count
    end
  end
end
