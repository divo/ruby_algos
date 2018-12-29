class MinStack
  @stack
  @min_stack

    def initialize()
      @stack = Array.new()
      @min_stack = Array.new()
    end

    def push(x)
      if @stack.last == nil || x <= @min_stack.last
        @min_stack.push(x)
      end
      @stack.push(x)
    end

    def pop()
      result = @stack.last
      @stack = @stack[0...@stack.count - 1]
      if @min_stack.last == result
        @min_stack.pop()
      end
      result
    end

    def top()
      @stack.last
    end

    def get_min()
      #@min
      @min_stack.last
    end

    def to_s
      @stack.to_s
    end

end

# Your MinStack object will be instantiated and called as such:
obj = MinStack.new()
obj.push("x")
obj.push("y")
puts obj.to_s
obj.pop()
puts obj.to_s
# param_3 = obj.top()
# param_4 = obj.get_min()
