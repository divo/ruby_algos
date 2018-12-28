#!/usr/bin/env ruby
class Queue 
  @queue
  @index
  
  def initialize
    @queue = []
    @index = 0
  end
  
  def enqueue(element)
    @queue[@index] = element
    @index = @index + 1
  end
  
  def dequeue
    result = @queue[0]
    @queue = @queue[1..@index]
    @index = @index - 1
    result
  end
  
  def to_s
    puts(@queue)
  end  
end


q = Queue.new()
q.enqueue("A")
q.enqueue("B")
puts(q.to_s)
puts(q.dequeue)
puts(q.to_s)

