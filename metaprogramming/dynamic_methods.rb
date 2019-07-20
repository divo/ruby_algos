class Test
  # Define a single method
  define_method :one do |arg|
    arg * 10
  end

  METHODS = [:two, :three]
  METHODS.map do |method|
    define_method method do |arg|
      "#{arg} #{method}"
    end
  end
end


puts Test.new.one 10
puts Test.new.two 20
puts Test.new.three 30
