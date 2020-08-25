class Test
  def one
    :one
  end
end

Test.class_eval do
  define_method(:two) { :two }
  def two_def; :two_def; end
end

# class_eval inside a new scope
lambda do
  Test.instance_eval do
    define_method(:three) { :three }
    def three_def; :three_def; end
  end
end.call

puts Test.new.one
puts Test.new.two
puts Test.new.two_def
puts Test.new.three
puts Test.new.three_def
