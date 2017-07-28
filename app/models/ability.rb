class Ability
  include CanCan::Ability

  def initialize user
    if user
      user_id = user.id
      can :manage, :all if user.try :admin?
      can :read, :all
      can :create, [Post, Comment]
      can [:update, :destroy], Post, user_id: user_id
      can [:update, :destroy], Comment, user_id: user_id
    else
      cannot [:create, :update, :destroy], :all
      can :read, :all
    end
  end
end
