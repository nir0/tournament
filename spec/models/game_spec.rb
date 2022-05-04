require 'rails_helper'

RSpec.describe Game, type: :model do
  it { is_expected.to belong_to(:team_1) }
  it { is_expected.to belong_to(:team_2) }
  it { is_expected.to belong_to(:winner).optional }

  describe "instance" do
    subject { build(:game) }
    it { is_expected.to be_valid }
  end
end
