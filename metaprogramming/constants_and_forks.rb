CONSTANT = [1, 2, 3].each
# Thread.current[:store] ||= [1, 2, 3].each # Makes no difference
Thread.current[:store] ||= CONSTANT
fork do
  puts Process.pid
  puts Thread.current[:store].next
  puts Thread.current[:store].next
end

fork do
  puts Process.pid
  puts Thread.current[:store].next
end
