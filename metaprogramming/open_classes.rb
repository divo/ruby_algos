class Klass
  def hello
    "hello"
  end
end

# Classes are open
class Klass
  def hello_world
    hello + " world"
  end
end

puts Klass.new.hello
puts Klass.new.hello_world

# Be carful how you use it
class Klass
  def hello
    "goodbye"
  end
end

puts Klass.new.hello_world

# Stdlib classes are also fair game
class Array
  def include?(_lol)
    true
  end
end

puts [].include? 11
