# @param {String} s
# @param {String} t
# @return {String}
# Input: s = "ADOBECNDEBAFC", t = "ADOBECN"
def min_window(s, t)
  return "" if s < t

  left = 0
  result = s
  counts = count_map(t)
  chars = s.chars
  chars.each_with_index do |c, right|
    counts[c] -= 1
    next if count_from_hash(t, counts).positive?

    while count_from_hash(t, counts) == 0 && left < right
require 'byebug'; byebug;
      l_char = chars[left]
      counts[l_char] += 1
      left += 1
    end
    counts[chars[left]] -= 1
    left -= 1 # We've moved the window 1 step too far
    window = chars[left..right]
    result = window if window.length < result.length
    left = right
    counts = count_map(t)
  end
  return "" if result == s

  result.join
end

def count_map(t)
  t.chars.each_with_object(Hash.new(0)) { |c, acc| acc[c] += 1 }
end

def count_from_hash(string, counts)
  string.chars.sum { |c| counts[c] }
end

puts min_window("ADOBECODEBANC", "ABC") # BANC

