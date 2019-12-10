# The one without eval
# Part 2
def add_checked_attribute(klass, attribute, &validation)
  klass.class_eval do
    define_method "#{attribute}=" do |value|
      raise unless validation.call(value)
      instance_variable_set("@#{attribute}", value)
    end

    define_method attribute do
      instance_variable_get("@#{attribute}")
    end
  end
end

class Test; end

add_checked_attribute(Test, :x) { |x| x <= 6 }
test = Test.new
test.x = 3
test.x = 10
