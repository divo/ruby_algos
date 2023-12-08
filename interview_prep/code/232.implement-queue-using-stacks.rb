class MyQueue
  def initialize()
    @queue = []
    @buffer = []
  end

  def push(x)
    @queue << x
  end

  def pop
    @buffer << @queue.pop until @queue.empty?
    result = @buffer.pop
    @queue << @buffer.pop until @buffer.empty?
    result
  end

  def peek()
    @buffer << @queue.pop until @queue.empty?
    result = @buffer.last # last == peek
    @queue << @buffer.pop until @buffer.empty?
    result
  end

  def empty()
    @queue.empty?
  end
end

# Your MyQueue object will be instantiated and called as such:
# obj = MyQueue.new()
# obj.push(x)
# param_2 = obj.pop()
# param_3 = obj.peek()
# param_4 = obj.empty()
