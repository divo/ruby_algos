class Test
  attr_reader :thing
end

puts "nil!" if Test.new.thing.nil?
