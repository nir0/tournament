class PlayoffService < BaseService
  def initialize
  end

  def call
    stage = 1
    while stage < 3
      winners_a = Game.a
        .where(stage: stage)
        .map(&:winner)
      winners_b = Game.b
        .where(stage: stage)
        .map(&:winner)
      stage += 1
      create_games_for(winners_a, stage: stage, division: 'a')
      create_games_for(winners_b, stage: stage, division: 'b')
      Game.where(stage: stage).each do |game|
        choose_winner_for(game)
      end
    end
    # final
    winners = Game
      .where(stage: 3)
      .map(&:winner)
    games = create_games_for(winners, stage: 4)
    choose_winner_for(games.first)
  end
end