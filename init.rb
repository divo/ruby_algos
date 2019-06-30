class Klass
  class << self
    def define(*args)
      klass = new(*args)
      yield klass if block_given?
      klass
    end
  end

  attr_reader :name
  def initialize(name)
    @name = name
  end
end

Klass.define('test') { |x| puts x.name }
