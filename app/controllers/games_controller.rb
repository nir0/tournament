class GamesController < ApplicationController
  def index
    @teams = Team.all
    @games_a_1 = Game.a.where(stage: 1)
    @games_a_2 = Game.a.where(stage: 2)
    @games_a_3 = Game.a.where(stage: 3)
    @games_b_1 = Game.b.where(stage: 1)
    @games_b_2 = Game.b.where(stage: 2)
    @games_b_3 = Game.b.where(stage: 3)
    @game_4 = Game.where(stage: 4).first
  end

  def prepare_division_a
    authorize!
    PrepareDivisionsService.new(
      division: 'a',
      teams: Team.all
    ).call
    redirect_to root_url
  end

  def prepare_division_b
    authorize!
    PrepareDivisionsService.new(
      division: 'b',
      teams: Team.all
    ).call
    redirect_to root_url
  end

  def playoff
    authorize!
    PlayoffService.new.call
    redirect_to root_url
  end
  

  # additional actions
  # not covered by tests
  def drop_data
    Game.delete_all
    Team.delete_all
    redirect_to root_url
  end

  def seed
    (1..16).map do |i|
      Team.create(name: "Team #{i}")
    end
    redirect_to root_url
  end
end
