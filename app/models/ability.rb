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

    elsif user.role? :manager
      # they can read any information in the system
      can :read, :all

      # they can create employee data
      can :create, User 

      # they can edit employee data
      can :update, User do |u|
        u.role != "admin"
      end

      # they can create items in the system
      can :create, Item

      # they can edit items in the system
      can :update, Item

      # they can create new prices for an items
      can :create, ItemPrice

      # they can add purchases to the system
      can :create, Purchase 

    else
      can :read, :all
    end

  end

end


