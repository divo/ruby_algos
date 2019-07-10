class Klass
  def a
    @a = 'a'
  end

  def b
    @b = 'b'
  end
end

a = Klass.new
a.a
puts a.instance_variables

ab = Klass.new
ab.a
ab.b
puts ab.instance_variables
