# @param {String} s
# @return {Integer}
def longest_palindrome(s)
  total =
    s
    .chars
    .each_with_object(Hash.new(0)) { |c, hash| hash[c] += 1 }
    .reduce(0) { |t, num| t += (num.last / 2) * 2 }

  total == s.length ? total : total + 1
end
