class Team < ApplicationRecord

  enum division: {
    "a": 1,
    "b": 2
  }
  
  def add_score(s)
    update(score: self.score + s)
  end
end
