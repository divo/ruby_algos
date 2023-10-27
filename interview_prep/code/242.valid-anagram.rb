# @param {String} s
# @param {String} t
# @return {Boolean}
def is_anagram(s, t)
  counts = s.chars.each_with_object(Hash.new(0)) do |char, acc|
    acc[char] += 1
  end

  t.chars.each do |char|
    counts[char] -= 1
  end

  counts.keys.all? { |key| counts[key] == 0 }
end

def is_anagram_sort(s, t)
  s.chars.sort == t.chars.sort
end
