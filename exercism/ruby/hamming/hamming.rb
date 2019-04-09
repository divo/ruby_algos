class Hamming
  def self.compute(first, second)
    raise ArgumentError unless first.length == second.length

    pairs = first.chars.zip(second.chars)
    count = 0
    pairs.count do |left, right|
      count += 1 if right != left
    end
  end
end
