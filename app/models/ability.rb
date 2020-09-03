class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, User
    can :create, User

    return unless user

    can :read, Availability
    can :create, Availability
    can :manage, Availability, user_id: user.id

    can :create, Invitation
    can :accept, Invitation, availability: { user_id: user.id }
    can :decline, Invitation, availability: { user_id: user.id }
  end
end
