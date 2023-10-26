# @param {String} s
# @return {String}
def reverse_vowels(s)
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
