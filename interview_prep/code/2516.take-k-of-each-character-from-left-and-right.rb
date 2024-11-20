# Example 1:
# Input: s = "aabaaaacaabc", k = 2
# Output: 8
# Explanation:
# Take three characters from the left of s. You now have two 'a' characters, and one 'b' character.
# Take five characters from the right of s. You now have four 'a' characters, two 'b' characters, and two 'c' characters.
# A total of 3 + 5 = 8 minutes is needed.
# It can be proven that 8 is the minimum number of minutes needed.
#
#
# Example 2:
#
# Input: s = "a", k = 1
# Output: -1
# Explanation: It is not possible to take one 'b' or 'c' so return -1.
# 	1 <= s.length <= 10⁵
# 	s consists of only the letters 'a', 'b', and 'c'.
# 	0 <= k <= s.length

# @param {String} s
# @param {Integer} k
# @return {Integer}
def take_characters(s, k)
  return 0 if k == 0

  left = 0
  right = s.length - 1
  counts = { 'a' => 0, 'b' => 0, 'c' => 0 }
  while left <= right
    counts[s.chars[left]] += 1
    counts[s.chars[right]] += 1

    # Need to offset positions to account for 0 index
    if counts.all? { |_, v| v >= k }
      return left + (s.length - right) if right - left <= 1

      return (left - 1) + (s.length - right)
    end

    left += 1
    right -= 1
  end
  -1
end
