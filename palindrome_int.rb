# @param {Integer} x
# @return {Boolean}
def is_palindrome(x)
  x_a = x.to_s.chars
  head = x_a[0, x_a.length / 2]
  tail = x_a[(x_a.length / 2), x_a.length]
  tail.shift unless x_a.length % 2 == 0
  head == tail.reverse
end
