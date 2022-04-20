class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, all, public: true

    return unless user.present? # additional permissions for logged in users (they can read their own posts)

    can :manage, all, user:
  end
end
