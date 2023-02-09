class Ability
  include CanCan::Ability

  def initialize(user)
    can :destroy, Inventory, user:
  end
end
