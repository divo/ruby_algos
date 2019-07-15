module StringExtensions
  refine String do
    def to_a
      "array"
    end
  end
end

class Example
  def self.one
    "".to_a
  end

  using StringExtensions

  def self.test
    "".to_a
  end
end

puts Example.test #=> array
puts Example.one #=> refinements.rb:11:in `one': undefined method `to_a' for "":String (NoMethodError)
