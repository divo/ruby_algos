class Acronym
  def self.abbreviate(sentance)
    sentance.gsub('-', ' ')
      .split(' ')
      .map(&:chars)
      .map(&:first)
      .reduce(:+)
      .upcase
  end
end
