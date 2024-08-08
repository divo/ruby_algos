# @param {String} s1
# @param {String} s2
# @return {Boolean}
# Check if a permutation of s1 is present in s2
def check_inclusion(s1, s2)
  chars = s1.chars
  left = 0
  right = 0

  while left < s2.length
    if chars.include?(s2[right])
      chars.delete_at(chars.find_index(s2[right]))
      right += 1
    else
      chars = s1.chars
      left += 1
      right = left
    end

    return true if chars.empty?
  end

  false
end

def check_inclusion_ruby_api(s1, s2)
  s1.chars
    .permutation
    .map(&:join)
    .any? { |permutation| s2.include?(permutation) }
end
