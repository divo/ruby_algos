class String
  alias_method :real_length, :length

  def length
    real_length > 5 ? 'long' : 'short'
  end
end

puts "Testing string".real_length
puts "Testing string".length
