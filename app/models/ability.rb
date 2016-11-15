class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user

    alias_action :create, :read, :update, :destroy, to: :crud

    if user.cf_admin?
      can :manage, :all

    elsif user.client_admin?
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

    elsif user.client_user? && user.developer.present?
      developer = user.developer

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

    elsif user.client_user? && user.division.present?
      division = user.division

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

    elsif user.owner?
      development_ids = user.plots.pluck(:development_id)

      can :read, Developer, development: { id: development_ids }
      can :read, Development, id: development_ids
      can :read, Division, developer: { development: { id: development_ids } }
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
end
