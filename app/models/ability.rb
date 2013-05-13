class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.persisted?
      can :manage, Project, :user_id => user.id 
    end
   # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
