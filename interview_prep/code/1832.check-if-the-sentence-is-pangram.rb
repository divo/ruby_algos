# @param {String} sentence
# @return {Boolean}
def check_if_pangram(sentence)
  # sentence.downcase.chars.uniq.length == 26
  sentence.downcase.chars.each_with_object({}) do |val, memo|
    memo[val] = true
  end.keys.count == 26
end
