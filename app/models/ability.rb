class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, User
    can :create, User

    return unless user

    can :create, Availability
    can :manage, Availability, user_id: user.id

    can :create, Invitation
  end
end
