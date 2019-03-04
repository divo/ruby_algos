class Series

  def initialize(digits)
    @digits = digits.chars
  end

  def slices(no)
    raise ArgumentError if no > @digits.count
    result = []
    @digits.each_index do |i|
      sequence = @digits[i, no]
      result.push sequence.join if sequence.count == no
    end
    result.flatten
  end
end
