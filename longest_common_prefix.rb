# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  return "" if strs.empty? || strs.first == ""
  result, index = "", 0
  until (current = strs.first[index]).nil?
    strs.each { |s| return result if current != s[index] }
    index, result = index + 1, result + current
  end
  result
end
