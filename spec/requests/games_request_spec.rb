require 'rails_helper'

RSpec.describe "GamesRequest", type: :request do
  describe "index" do
    let!(:teams) { create_list(:team, 2) }
    let!(:games_a_1) do
      create_list(:game, 2, 
        division: 'a', 
        stage: 1,
        team_1: teams.first,
        team_2: teams.last
      )
    end

    let!(:games_a_2) do
      create_list(:game, 2, 
        division: 'a', 
        stage: 2,
        team_1: teams.first,
        team_2: teams.last
      )
    end

    let!(:games_a_3) do
      create_list(:game, 2, 
        division: 'a', 
        stage: 3,
        team_1: teams.first,
        team_2: teams.last
      )
    end

    let!(:games_b_1) do
      create_list(:game, 2, 
        division: 'b', 
        stage: 1,
        team_1: teams.first,
        team_2: teams.last
      )
    end

    let!(:games_b_2) do
      create_list(:game, 2, 
        division: 'b', 
        stage: 2,
        team_1: teams.first,
        team_2: teams.last
      )
    end

    let!(:games_b_3) do
      create_list(:game, 2, 
        division: 'b', 
        stage: 3,
        team_1: teams.first,
        team_2: teams.last
      )
    end

    let!(:game_4) do
      create(:game,  
        stage: 4,
        team_1: teams.first,
        team_2: teams.last
      )
    end

    before { get "/" }

    describe "response" do
      subject { response }
      it { is_expected.to be_ok }
    end

    it 'assigns' do
      expect(assigns(:teams)).to contain_exactly(*teams)
      expect(assigns(:games_a_1)).to contain_exactly(*games_a_1)
      expect(assigns(:games_a_2)).to contain_exactly(*games_a_2)
      expect(assigns(:games_a_3)).to contain_exactly(*games_a_3)
      expect(assigns(:games_b_1)).to contain_exactly(*games_b_1)
      expect(assigns(:games_b_2)).to contain_exactly(*games_b_2)
      expect(assigns(:games_b_3)).to contain_exactly(*games_b_3)
      expect(assigns(:game_4)).to eq(game_4)
    end
  end
end
