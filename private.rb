class One
  private

  def a
    puts "Hi from a"
  end
end

class Two < One
  def a
    super
    puts "Hi from b"
  end
end

Two.new.a
