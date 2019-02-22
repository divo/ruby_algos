class HighScores
  attr_reader :latest
  attr_reader :scores
  def initialize(scores)
    @scores = scores
    @latest = scores.last
    @ranked_scores = scores.sort.reverse
  end

  def personal_best
    @ranked_scores.first
  end

  def personal_top_three
    @ranked_scores[0, 3]
  end
end
