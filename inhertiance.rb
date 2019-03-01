class Parent
  def thing
    work
    puts "parent"
  end

  def work
    puts "parent work"
  end
end

class Child < Parent
  def thing
    super
    puts "child"
  end

  def work
    puts "child work"
  end
end

Child.new().thing
