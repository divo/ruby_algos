# @param {String} s
# @param {String} t
# @return {Boolean}
def is_anagram(s, t)
  return false if s.length != t.length
  # Anagram uses all the other letters only once
  t = t.split("")
  s.split("").each do |c|
    if index = t.index(c) 
      t.delete_at(index)
    end
  end
  t.count == 0
end
