# @param {String} s
# @param {Integer} k
# @return {String}
def reverse_str(s, k)
    reversed = s.chars.each_slice(k).to_a.each_with_index do |val, index|
      if index % 2 == 0
        val.reverse!
      end
    end
  reversed.flatten.join
end
