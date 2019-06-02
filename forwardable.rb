# Forwardable module provides delegation of specific methods to a designated object
# using #def_delegator and #def_delgators

require 'forwardable'

class ArrayLike
  extend Forwardable
  def_delegators :@result_array, :<<, :[]

  def initialize
    @result_array = []
  end
end

array_like = ArrayLike.new
array_like << 1
puts array_like[0]
puts array_like[1].nil?
array_like << 12
puts array_like[1]
