# Class to count occurrences of individual words in a string
class Phrase
  WORD_REGEX = /\b[\w']+\b/

  def initialize(phrase)
    @phrase = to_words(phrase)
  end

  def word_count
    @phrase.each_with_object(Hash.new(0)) do |word, result|
      result[word] += 1
    end
  end

  private

  def to_words(phrase)
    phrase.downcase.scan(WORD_REGEX)
  end
end
