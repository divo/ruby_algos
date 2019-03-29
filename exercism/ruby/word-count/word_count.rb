# Class to count occurrences of individual words in a string
class Phrase
  WORD_REGEX = /\b[\w']+\b/

  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    words.each_with_object(Hash.new(0)) do |word, result|
      result[word] += 1
    end
  end

  private

  def words
    @phrase.downcase.scan(WORD_REGEX)
  end
end
