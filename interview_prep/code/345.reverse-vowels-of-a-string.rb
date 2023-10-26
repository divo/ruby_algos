# @param {String} s
# @return {String}
def reverse_vowels(s)
  vowels = "aeiuoAEIUO"

  left, right = 0, s.length - 1
  result = s.chars
  while left < right
    # Increment left until a vowel is found
    while left < right && !vowels.include?(result[left])
      left += 1
    end

    # Increment right until a vowel is found
    while left < right && !vowels.include?(result[right])
      right -= 1
    end

    result[left], result[right] = result[right], result[left]
    left += 1
    right -= 1
  end
  result.join
end

def reverse_vowels_2n(s)
  # Just need a stack of vowels
  vowels = s.chars.each_with_object([]) do |val, acc|
    if %w(a e i o u).include? val.downcase
      acc << val
    end
  end

  s.chars.each_with_object([]) do |val, acc|
    if %w(a e i o u).include? val.downcase
      acc << vowels.pop
    else
      acc << val
    end
  end.join
end
