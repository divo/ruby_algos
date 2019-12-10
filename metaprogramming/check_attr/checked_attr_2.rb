# The one without eval
# Part 2
def add_checked_attribute(klass, attribute)
  klass.class_eval do
    define_method "#{attribute}=" do |value|
      raise unless value
      instance_variable_set("@#{attribute}", value)
    end

    define_method attribute do
      instance_variable_get("@#{attribute}")
    end
  end
end

class Test; end

add_checked_attribute(Test, :x)
test = Test.new
test.x = 3
#test.x = nil
