module Nodule
  def test(*args)
    puts 'module'
    super
  end
end

class Klass
  def test
    puts "test"
  end
end

Klass.prepend(Nodule)
Klass.new.test # Raises, Nodule#test needs args
