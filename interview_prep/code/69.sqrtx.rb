# @param {Integer} x
# @return {Integer}
def my_sqrt(x)
end


# First attempt, not the best looking
# The input X has a max of 2³¹, so a solution with O(n) complexity isn't going to work
# The correct solution is to use binary search, which I will revise later 
def my_sqrt(x)
  return x if x <= 1

  return 1 if x <= 3

  Array(1..(x / 2.0).ceil).each_cons(2) do |l, r|
    if r * r == x
      return r
    elsif r * r > x
      return l
    end
  end
end
