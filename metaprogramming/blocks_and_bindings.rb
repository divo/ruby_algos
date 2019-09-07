def my_method
  x = 'Goodbye' # This is ignored by the block, which all makes sense
  yield('cruel')
end

x = 'Hello' # This gets passed along with the block, or is bound to the block
puts my_method { |y| "#{x}, #{y} world" } # Hello cruel world

