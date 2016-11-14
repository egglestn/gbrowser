class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user

    if user.cf_admin?
      can :manage, :all
    elsif user.client_admin?
      can :manage, :all
    elsif user.client_user?
      can :manage, :all
    elsif user.owner?
      can :manage, :all
    end
  end
end
