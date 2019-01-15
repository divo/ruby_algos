# Cannot use for loops. They only go forwards?
def reverse_string(s)
  result = ""
  x = s.length - 1
  while x >= 0
    result += s[x]
    x = x - 1
  end
  result
end

puts reverse_string("hello")
