require 'rails_helper'

RSpec.describe PrepareDivisionsService, type: :service do
  describe "with teams" do
    let(:teams) { create_list(:team, 16) }

    describe "service called" do
      before do
        PrepareDivisionsService.new(division: 'a', teams: teams).call
      end

      describe "teams on division A" do
        subject { Team.a }
        its(:count) { is_expected.to eq 8 }
      end

      describe "teams on division B" do
        subject { Team.b }
        its(:count) { is_expected.to eq 0 }
      end

      describe "games on division A" do
        subject { Game.a }
        its(:count) { is_expected.to eq 4 }
      end
    end
  end

  describe "with half of teams assigned" do
    let(:teams) do
      create_list(:team, 8, division: 'a') +
      create_list(:team, 8)
    end

    describe "service called" do
      before do
        PrepareDivisionsService.new(division: 'b', teams: teams).call
      end

      describe "teams on division A" do
        subject { Team.a }
        its(:count) { is_expected.to eq 8 }
      end

      describe "teams on division B" do
        subject { Team.b }
        its(:count) { is_expected.to eq 8 }
      end

      describe "games on division B" do
        subject { Game.b }
        its(:count) { is_expected.to eq 4 }
      end
    end
  end
end
