# contains shared methods
class BaseService
  def choose_winner_for(game)
    # to avoid draws
    score_1 = random_score
    score_2 = random_score(exclude: score_1)
    game.team_1.add_score(score_1)
    game.team_2.add_score(score_2)
    game.winner = score_1 > score_2 ? game.team_1 : game.team_2
    game.save
  end

  def random_score(exclude: nil)
    ([1, 2, 3, 4, 5] - [exclude]).sample
  end
  
  # Play-off inital schedule is made by 
  # principle - best team plays against 
  # worst team
  def create_games_for(winners, stage:, division: nil)
    winners.sort_by!{|x|x.score}
    games = []
    while winners.present?
      games << Game.create(
        stage: stage,
        division: division,
        team_1: winners.pop,
        team_2: winners.shift
      )
    end
    return games
  end
end