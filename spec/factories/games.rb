FactoryBot.define do
  factory :game do
    division { nil }
    team_1 { build(:team) }
    team_2 { build(:team) }
    stage { 1 }
  end
end
