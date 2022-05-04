require 'rails_helper'

RSpec.describe PlayoffService, type: :service do

  describe "with prepared divisions" do
    let(:teams) { create_list(:team, 16) }
    before do 
      PrepareDivisionsService.new(division: 'a', teams: teams).call
      PrepareDivisionsService.new(division: 'b', teams: teams).call
    end

    describe 'playoff executed' do
      before { PlayoffService.new.call }

      describe "1st stage games division A" do
        subject { Game.a.where(stage: 1) }
        its(:count) { is_expected.to eq 4 }
      end 
      describe "2nd stage games division A" do
        subject { Game.a.where(stage: 2) }
        its(:count) { is_expected.to eq 2 }
      end
      describe "3rd stage games division A" do
        subject { Game.a.where(stage: 3) }
        its(:count) { is_expected.to eq 1 }
      end
      describe "final game" do
        subject { Game.where(stage: 4) }
        its(:count) { is_expected.to eq 1 }
      end
    end
  end
end