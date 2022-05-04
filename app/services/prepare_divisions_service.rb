class PrepareDivisionsService < BaseService
  # Given: 16 teams
  # Result: 4 games with winners per 2 divisions
  def initialize(teams:, division:)
    raise "Teams count is not 16" if teams.count != 16
    @teams = teams
      .select{ |x| x.division.nil? }
      .sort_by{ |x| rand(100) }
    @division = division
  end

  def call
    4.times do
      team_1 = @teams.pop
      team_2 = @teams.pop
      ActiveRecord::Base.transaction do
        team_1.update(division: @division)
        team_2.update(division: @division)
        game = Game.create(
          division: @division,
          stage: 1,
          team_1: team_1,
          team_2: team_2
        )
        choose_winner_for(game)
      end
    end
  end
end