puts Missing # This raises

class Module
  class Test
  end

  def const_missing(const)
    Module::Test
  end
end

puts Missing # This does not
