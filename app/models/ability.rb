class Ability
  include CanCan::Ability

  def initialize(user)
    can :create, User

    return unless user

    if user.admin?
      can :manage, :all
    else
      can :read, User
      can :manage, User, id: user.id

      can :read, Availability
      can :create, Availability
      can :manage, Availability, user_id: user.id

      can :create, Invitation
      can :accept, Invitation, to_user_id: user.id
      can :decline, Invitation, to_user_id: user.id

      # can send messages and delete own messages in own availability
      can :manage, Message, availability: { user_id: user.id }, user_id: user.id

      # can send messages and delete own messages in an availability
      # with accepted invitation
      can :manage, Message do |message|
        next false if message.user_id != user.id
        message.availability.invitations.accepted.where(from_user: user.id).any?
      end

      can :manage, Message do |message|
        next false if message.user_id != user.id
        message.availability.invitations.accepted.where(to_user: user.id).any?
      end

      can :create, Comment
      can :manage, Comment, from_user_id: user.id

      can :read, Interest
      can :create, Interest
      can :manage, Interest, user_id: user.id

      can :read, DirectMessage, to_user_id: user.id
      can :create, DirectMessage
      can :manage, DirectMessage, from_user_id: user.id
    end
  end
end
