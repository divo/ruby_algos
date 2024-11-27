class Pangram
  def self.regex_pangram?(string)
    string.downcase
          .scan(/[a-z]/)
          .uniq
          .count == 26
  end

  def self.pangram?(string)
    alphabet = ('a'..'z').to_a
    string.downcase.chars.each do |c|
      alphabet.delete c
    end
    alphabet.empty?
  end
end
