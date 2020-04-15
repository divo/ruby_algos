module One
  class Two
    TEST = 'two'

    def self.test
      TEST
    end

    def self.meth
      'two'
    end
  end

  class Three
    TEST = 'three'

    def self.test
      TEST
    end
  end

  class Four < Two
    TEST = 'four'

    def self.meth
      'four'
    end
  end
end

puts One::Two.test
puts One::Two.meth
# Classes scope constants
puts One::Three.test

puts One::Four.test
puts One::Four.meth
