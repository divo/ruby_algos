class Test
  class << self
    def test
      "This is on the meta class"
    end
  end
end

puts Test.test
