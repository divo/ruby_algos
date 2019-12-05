def explore_array(method)
  code = "['a', 'b', 'c'].#{method}"
  puts "Evaluating: #{code}"
  eval code
end

# Requires some parsing to break the method and args apart
def explore_array_dispatch(method, *args)
  ['a', 'b', 'c'].send(method, *args)
end

#loop { puts explore_array(gets.chomp()) }
loop { puts explore_array_dispatch(gets.chomp()) }
