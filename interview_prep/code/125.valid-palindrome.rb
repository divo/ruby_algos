# @param {String} s
# @return {Boolean}
def is_palindrome(s)
  chars = s.downcase.gsub(/[[:punct:]\s]/, '')
  left, right = 0, chars.length - 1

  while left < right
    return false unless chars[left] == chars[right]

    left += 1
    right -= 1
  end

  true
end

def is_palindrome_arrays(s)
  letters = s.downcase.gsub(/[[:punct:]\s]/, '').chars
  middle = letters.count / 2
  end_idx = letters.count
  # Need to account for odd length strings, the middle char is by definition repeated in both
  r_middle = (letters.count % 2).zero? ? middle : middle + 1

  letters[0...middle].join == letters[r_middle...end_idx].reverse.join
end
