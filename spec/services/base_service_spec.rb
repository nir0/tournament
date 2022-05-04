require 'rails_helper'

RSpec.describe BaseService, type: :service do
  describe "#choose_winner_for" do
    let(:team_1) { create(:team) }
    let(:team_2) { create(:team) }
    let(:game) { create(:game, team_1: team_1, team_2: team_2) }

    before do
      service = BaseService.new
      allow(service).to receive(:random_score).and_return(1, 2)
      service.choose_winner_for(game)
    end

    describe "team_1 score" do
      subject { team_1.reload.score }
      it { is_expected.to eq 1 }
    end

    describe "team_2 score" do
      subject { team_2.reload.score }
      it { is_expected.to eq 2 }
    end

    describe "game winner" do
      subject { game.reload.winner }
      it { is_expected.to eq team_2 }
    end
  end
end
