# @param {String} s
# @return {Boolean}
# @param {String} s
# @return {Boolean}
def is_palindrome(s)
  return true if s.length <= 1

  valid_chars = ('a'..'z').to_a + (0..9).map(&:to_s)
  chars = s.chars
  l = 0
  r = chars.length - 1
  while true
    # Skip punctuation
    l += 1 until valid_chars.include?(chars[l]&.downcase) || l > chars.length
    r -= 1 until valid_chars.include?(chars[r]&.downcase) || r < 0

    return true if l >= r

    return false unless chars[l].downcase == chars[r].downcase

    l += 1
    r -= 1
  end
  true
end

def is_palindrome(s)
  chars = s.downcase.gsub(/[[:punct:]\s]/, '')
  left = 0
  right = chars.length - 1

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
