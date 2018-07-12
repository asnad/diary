class Ability
  include CanCan::Ability

  def initialize(user)
    if user.administrator?
      can :manage, :all
      cannot :destroy, User
      cannot :disable, User, id: User.where("id =? AND status = ?", user.id, User.statuses[:disabled]).pluck(:id)
      cannot :activate, User, id: User.where("id =? AND status = ?", user.id, User.statuses[:active]).pluck(:id)
    elsif user.coordinator?
      can :manage, ActiveAdmin::Page, name: 'Dashboard'
    end
  end
end
