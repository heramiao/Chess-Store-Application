class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.role? :admin
      can :manage, :all

    elsif user.role? :shipper
      # they can read or update their own profile
      can [:show, :update], User do |u|
        u.id == user.id
      end

      # they can read info about items
      can :read, Item 

    else
      can :read, :all
    end

  end

end


