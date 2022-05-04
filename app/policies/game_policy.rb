class GamePolicy < ApplicationPolicy
  # See https://actionpolicy.evilmartians.io/#/writing_policies
  #
  # def index?
  #   true
  # end
  #
  # def update?
  #   # here we can access our context and record
  #   user.admin? || (user.id == record.user_id)
  # end

  # Scoping
  # See https://actionpolicy.evilmartians.io/#/scoping
  #
  # relation_scope do |relation|
  #   next relation if user.admin?
  #   relation.where(user: user)
  # end

  def prepare_division_a?
    Team.where(division: nil).count >= 8 && 
      Team.where(division: 'a').count == 0 &&
      Game.where(division: 'a').count == 0
  end

  def prepare_division_b?
    Team.where(division: nil).count >= 8 && 
      Team.where(division: 'b').count == 0 &&
      Game.where(division: 'b').count == 0
  end

  def playoff?
    Team.where(division: ['a', 'b']).count == 16 &&
      Game.where(stage: [2,3,4]).count == 0
  end

end
