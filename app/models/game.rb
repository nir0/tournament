class Game < ApplicationRecord
  belongs_to :team_1, class_name: 'Team'
  belongs_to :team_2, class_name: 'Team'
  belongs_to :winner, class_name: 'Team', optional: true
  
  enum division: {
    "a": 1,
    "b": 2
  }
end
