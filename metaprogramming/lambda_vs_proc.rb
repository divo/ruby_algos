# In a lambda return behaves normally, just returns out of the lambda
def double(callable_object)
  callable_object.call * 2
end

l = lambda { return 10 }
puts double(l) # 20

# In a proc it returns out of the scope the proc was defined in!
def another_double
  p = Proc.new { return 10 }
  result = p.call
  return result * 2 # Unreachable!
end

puts another_double # 10

def better_double
  p = Proc.new { 10 } # Avoid using returns, let the value fall out to avoid this
  result = p.call
  return result * 2
end

puts better_double # 20
