class Acronym
  def self.abbreviate(sentance)
    sentance.gsub('-', ' ')
      .scan(/\b[a-zA-Z]/)
      .reduce(:+)
      .upcase
  end
end
