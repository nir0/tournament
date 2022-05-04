class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(permitted_params)
    if @team.save
      redirect_to :teams
    else
      render 'new'
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update(permitted_params)
      redirect_to :teams
    else
      render 'edit'
    end
  end

  private

    def permitted_params
      params.require(:team).permit(
        :name
      )
    end
end
