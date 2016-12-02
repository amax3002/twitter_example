class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
      if user.admin?
        can :manage, :all
      else
        can :read, :all
      end

    #index and show
    can :read, Tweet
    can :create, Tweet
    can :manage, Tweet, user_id: user.id
  end
end
