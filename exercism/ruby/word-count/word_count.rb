# Class to count occurrences of individual words in a string
class Phrase
  def initialize(phrase)
    @phrase = phrase.downcase.gsub(/[^a-z0-9'\s]/i, ' ')
  end

  def word_count
    result = Hash.new(0)
    @phrase.split.each do |word|
      result[strip_quotes(word)] += 1
    end
    result
  end

  private

  def strip_quotes(word)
    if word[0] == "'" && word[-1] == "'"
      word[1...word.length - 1]
    else
      word
    end
  end
end
