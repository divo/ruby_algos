# @param {String} s
# @param {Integer} k
# @return {Integer}
# Input: s = "AABABBA", k = 1
# Input: s = "ABAB", k = 2
# len: 5
# A: 2
# B: 2
def character_replacement(s, k)
  left, max = 0, 0
  counts = Hash.new(0)
  chars = s.chars
  chars.each_with_index do |c, right|
    w_len = right - left + 1
    counts[c] += 1
    if w_len - counts.max_by { 2 }.last <= k
      max = [w_len, max].max
    else
      counts[chars[left]] -= 1
      left += 1
    end
  end
  max
end

# puts character_replacement("ABAA", 0) # 2

def character_replacement_my_incorrect_solution(s, k)
  left, right, max = 0, 0, 0    
  chars = s.chars
  while right < s.length
    rem_subs = k
    current_char = chars[left]
    new_char = nil
    while (rem_subs > 0 || chars[right] == current_char)
      if chars[right] == current_char
        right += 1
      else
        new_char ||= right # Store index of _first_ seen new char
        rem_subs -= 1
        right += 1
      end
    end

    max = [max, right - left].max
    left = right = new_char
  end

  max
end
