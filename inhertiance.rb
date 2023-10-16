class Parent
  def thing
    self.work
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

def NewThing
  def hi
    puts "This is me pissing about in VR, It's just ok"
  end
end
