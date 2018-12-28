class MinStack
  @stack

    def initialize()
      @stack = Array.new()
    end

    def push(x)
      @stack.push(x)
    end

    def pop()
      result = @stack.last
      @stack = @stack[0...@stack.count - 1]
      result
    end

    def top()
        
    end

    def get_min()
        
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
