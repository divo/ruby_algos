class String
  alias_method :real_length, :length

  def length
    real_length > 5 ? 'long' : 'short'
  end
end

puts "Testing string".real_length
puts "Testing string".length

module StringRefinment
  refine String do
    def size
      super > 5 ? 'many' : 'few'
    end
  end
end


puts "Testing string".size
using StringRefinment
puts "Testing string".size

module ExplicitString
  def length
    super > 5 ? 'many' : 'few'
  end
end

String.class_eval do
  prepend ExplicitString
end


puts "Testing string".length # => 'many'
