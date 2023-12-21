class Integer
  N_BYTES = [42].pack('i').size
  N_BITS = N_BYTES * 16
  MAX = 2 ** (N_BITS - 2) - 1
  MIN = -MAX - 1
end

class MinStack
  def initialize
    @stack = []
    @top = -1
    @min = []
  end

  def push(val)
    @top += 1
    @stack[@top] = val
    @min << val if val <= get_min
  end

  def pop
    return nil if @top == -1

    result = @stack[@top]
    @stack.delete_at(@top)
    @top -= 1
    @min.pop if get_min == result

    result
  end

  def top
    return nil if @top == -1

    @stack[@top]
  end

  def get_min
    @min.last || Integer::MAX
  end
end
