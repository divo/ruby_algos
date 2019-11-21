class MyClass

  @var = 1

  def self.read
    @var
  end

  def write(x)
    @var = x
  end

  def read
    @var
  end
end

obj = MyClass.new
puts obj.read # nil
obj.write 2
puts obj.read # 2
puts MyClass.read # 1
