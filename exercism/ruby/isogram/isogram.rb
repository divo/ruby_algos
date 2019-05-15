module Isogram
  def self.isogram?(string)
    stripped_string = string.downcase.gsub(/[^a-z]/i, '')
    stripped_string.length == stripped_string.chars.uniq.length
  end
end
