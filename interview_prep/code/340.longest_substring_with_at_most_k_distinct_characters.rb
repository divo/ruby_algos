# Premium question, I don't have access to
#

def find_length(string, k)
  max, w_start, w_end = 0, 0, 0
  while w_start < string.length
    # uniq is a bit of a cheat, instead we can keep track of uniq chars in a hash
    if string[w_start..w_end].chars.uniq.length <= k
      window_len = w_end - w_start + 1
      max = window_len if window_len > max
      w_end += 1
      w_start += 1 if w_end >= string.length # This is the piece I was missing
    else
      w_start += 1
      w_end = w_start
    end
  end
  max
end


puts find_length("araaci", 2) # 4
puts find_length("araaci", 1) # 2
puts find_length("cbbebi", 3) # 5
