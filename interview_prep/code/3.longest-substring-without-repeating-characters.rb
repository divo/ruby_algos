# @param {String} s
# @return {Integer}
# Input: s = "abcabcbb"
# "bbbbb"
# l: 0
# r: 0
# m: 0
def length_of_longest_substring(s)
  # Sliding window, move the left of the window until we have a repeated character
  # Then move the right of the window until all characters are uniq
  max, left, right = 0, 0, 0
  chars = Hash.new(0)
  while right < s.length
    chars[s[right]] += 1
    if chars.all? { |_, v| v == 1 }
#    if uniq(s[left..right])
#    if s[left..right].chars.uniq.length == s[left..right].length
      max = [right - left + 1, max].max
      right += 1
    else
      chars[s[left]] -= 1
      chars[s[right]] -= 1
      chars.delete(s[left]) if chars[s[left]] == 0
      left += 1
    end
  end
  max
end

def length_of_longest_substring_without_hash(s)
  # Sliding window, move the left of the window until we have a repeated character
  # Then move the right of the window until all characters are uniq
  max, left, right = 0, 0, 0
  while right < s.length
    if uniq(s[left..right])
#    if s[left..right].chars.uniq.length == s[left..right].length
      max = [right - left + 1, max].max
      right += 1
    else
      left += 1
    end
  end
  max
end

# Roll me own uniq
def uniq(s)
  s.chars
   .each_with_object(Hash.new(0)) { |c, memo| memo[c] += 1 }
   .all? { |_, v| v == 1 }
end

puts length_of_longest_substring("abcabcbb")
