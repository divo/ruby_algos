class Series

  def initialize(digits)
    @digits = digits.chars
  end

  def slices(no)
    raise ArgumentError if no > @digits.count
    result = []
    @digits.each_cons(no) { |seq| result.push(seq.join) }
    result
  end
end
