module Nodule
  def test
    puts 'module'
    super
  end
end

class Klass
  def test(arg)
    puts "test #{arg}"
  end
end

Klass.prepend(Nodule)
Klass.new.test('hi') # Raises, Nodule#test needs args
