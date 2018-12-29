def is_valid(s)
  @stack = Array.new()
  @pairs = {'(' => ')', '{' => '}', '[' => ']'} #Still need to understand how vars work, is just plain 'name' even a thing?

  s.split('').each { |c| #Don't use loops! Use iterators always
    if @pairs[@stack.last] == c
      @stack.pop
    else
      @stack.push(c) #There is no add
    end
  }

  return @stack.empty? #How to check for empty array
end
