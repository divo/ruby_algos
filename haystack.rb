def str_str(stack, needle)
  return 0 if stack.empty? && needle.empty?
  return -1 if stack.empty?
  
  if needle.length > stack.length
    tmp = stack
    stack = needle
    needle = tmp
  end
  
  stack.chars.each_with_index do |char, index|
    result = index
    needle.chars.each do |n_char|
      if char != n_char
        result = nil
      end
    end
    return result if result
  end
  return -1
end

puts str_str "hello", "ll"
