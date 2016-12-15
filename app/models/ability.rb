# frozen_string_literal: true
class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user

    alias_action :create, :read, :update, :destroy, to: :crud
    role_abilities(user.role, user)
  end

  private

  def role_abilities(role, user)
    case role.to_sym
    when :admin
      can :manage, :all

    when :user
      user_abilities(user)
    end
  end

  # rubocop:enable MethodLength

  def user_abilities(user)
    development_ids = user.plots.pluck(:development_id)

    can :read, Developer, developments: { id: development_ids }
    can :read, Development, id: development_ids
    can :read, Division, developer: { developments: { id: development_ids } }
    can :read, Document, development_id: development_ids
    can :read, Finish, development_id: development_ids
    can :read, Image, development_id: development_ids
    can :read, Phase, development_id: development_ids
    can :read, Plot, development_id: development_ids
    can :read, Room, development_id: development_ids
    can :read, UnitType, development_id: development_ids

    can :manage, User, id: user.id
  end
end
