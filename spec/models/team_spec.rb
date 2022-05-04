require 'rails_helper'

RSpec.describe Team, type: :model do
  describe "instance" do
    subject { build(:team) }
    it { is_expected.to be_valid }
  end

  describe "add_score" do
    subject { create(:team, score: 0) }
    before { subject.add_score(5) }
    its(:score) { is_expected.to eq 5 }
  end
end
