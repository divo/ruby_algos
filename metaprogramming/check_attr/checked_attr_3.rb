# The one without eval
module CheckedAttr

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def attr_checked(attribute, &validation)
      define_method "#{attribute}=" do |value|
        raise unless validation.call(value)
        instance_variable_set("@#{attribute}", value)
      end

      define_method attribute do
        instance_variable_get("@#{attribute}")
      end
    end
  end
end

class Test
  include CheckedAttr

  attr_checked :x do |x|
    x <= 6
  end
end

test = Test.new
test.x = 3
