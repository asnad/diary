class Ability
  include CanCan::Ability

  def initialize(user)
    if user.administrator?
      can :manage, :all
    elsif user.coordinator?
      can :manage, ActiveAdmin::Page, name: 'Dashboard'
    end
  end
end
