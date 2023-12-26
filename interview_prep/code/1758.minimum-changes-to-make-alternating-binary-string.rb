# @param {String} s
# @return {Integer}
def min_operations(s)
  [count_changes(s, '0'), count_changes(s, '1')].min
end

def count_changes(s, n_char)
  count = 0
  s.chars.each do |c|
    count += 1 if c != n_char
    n_char = n_char == '1' ? '0' : '1'
  end
  count
end
