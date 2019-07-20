class Test
  # Define a single method
  define_method :one do |arg|
    arg * 10
  end
end


puts Test.new.one 10
