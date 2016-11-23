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
    when :cf_admin
      can :manage, :all

    when :client_admin
      client_admin_abilities

    when :client_user
      client_user_abilities(user)

    when :owner
      owner_abilities(user)
    end
  end

  def client_user_abilities(user)
    if user.division.present?
      client_user_division_abilities(user.division)
    elsif user.developer.present?
      client_user_developer_abilities(user.developer.id)
    end
  end

  # rubocop:disable MethodLength
  # Method is long, but not complex for a user to read
  def client_admin_abilities
    can :manage,
        [
          Document,
          Finish,
          Image,
          Plot,
          User
        ]

    can :read,
        [
          Developer,
          Development,
          Division,
          Phase,
          Room,
          UnitType
        ]
  end
  # rubocop:enable MethodLength

  def client_user_developer_abilities(developer)
    can :crud, Document, developer_id: developer.id
    can :crud, Finish, developer_id: developer.id
    can :crud, Image, developer_id: developer.id
    can :crud, Plot, developer_id: developer.id
    can :crud, User, developer_id: developer.id

    can :read, Developer, id: developer.id
    can :read, Development, developer_id: developer.id
    can :read, Division, developer_id: developer.id
    can :read, Phase, developer_id: developer.id
    can :read, Room, developer_id: developer.id
    can :read, UnitType, developer_id: developer.id
  end

  def client_user_division_abilities(division)
    can :crud, Document, division_id: division.id
    can :crud, Finish, division_id: division.id
    can :crud, Image, division_id: division.id
    can :crud, Plot, division_id: division.id
    can :crud, User, division_id: division.id

    can :read, Developer, id: division.developer_id
    can :read, Development, division_id: division.id
    can :read, Division, id: division.id
    can :read, Phase, division_id: division.id
    can :read, Room, division_id: division.id
    can :read, UnitType, division_id: division.id
  end

  def owner_abilities(user)
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
