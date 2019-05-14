module Isogram
  def self.isogram?(string)
    stripped_string = string.downcase.gsub(/[^a-z0-9]/i, '')
    stripped_string.length == stripped_string.chars.uniq.count
  end
end
