# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
  strs.each_with_object(Hash.new([])) do |x, hash|
    hash[x.chars.sort] += [x]
  end.values
end


def group_anagrams_simple(strs)
  strs.group_by { |x| x.chars.sort }.values
end
