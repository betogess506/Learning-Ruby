class ScoreKeeper
  attr_reader :total_score, :count
  def initialize
    @total_score = 0
    @count = 0
  end
  def <<(score)
    @total_score += score
    @count += 1
    self
  end
end

sk = ScoreKeeper.new
sk << 5
sk << 12
sk << 32
puts sk.total_score
puts sk.count
puts sk << 49
