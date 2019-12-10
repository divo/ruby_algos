def add_checked_attribute(klass, attribute)
  str =  "
    class #{klass}
      def #{attribute}()
        @#{attribute}
      end

      def #{attribute}=(value)
        raise unless value
        @#{attribute} = value
      end
    end
  "
  eval(str)
end

class Test; end

add_checked_attribute(Test, :x)
test = Test.new
test.x = 3
test.x = nil
