# @param {String} s
# @return {Boolean}
def is_palindrome(s)
  letters = s.downcase.gsub(/[[:punct:]\s]/, '').chars
  middle = letters.count / 2
  end_idx = letters.count
  # Need to account for odd length strings, the middle char is by definition repeated in both
  r_middle = (letters.count % 2).zero? ? middle : middle + 1

  letters[0...middle].join == letters[r_middle...end_idx].reverse.join
end
