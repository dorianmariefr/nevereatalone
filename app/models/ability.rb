class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, User
    can :create, User

    return unless user

    can :manage, User, id: user.id

    can :read, Availability
    can :create, Availability
    can :manage, Availability, user_id: user.id

    can :create, Invitation
    can :accept, Invitation, availability: { user_id: user.id }
    can :decline, Invitation, availability: { user_id: user.id }

    can :manage, Message, availability: { user_id: user.id }
    can :manage, Message do |message|
      message.availability.invitations.accepted.where(user_id: user.id).any?
    end
  end
end
