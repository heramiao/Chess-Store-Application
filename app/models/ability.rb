class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.role? :admin
      can :manage, :all

    elsif user.role? :shipper
      # they can read their own profile
      can :show, User do |u|
        u.id == user.id
      end

      # they can update their own profile
      can :edit_current_user, User 

      # they can read info about items
      can :read, Item 

    elsif user.role? :manager
      # they can read any information in the system
      can :read, :all
      can :customer_index, User
      can :employee_index, User

      # they can create employee data
      can :create, User do |u|
        u.role != "customer"
      end

      # they can edit employee data
      can :update, User do |u|
        u.role != "admin"
        u.role != "customer"
      end

      # they can update their own profile
      can :edit_current_user, User

      # they can create items in the system
      can :create, Item

      # they can edit items in the system
      can :update, Item

      # they can create new prices for an items
      can :create, ItemPrice

      # they can add purchases to the system
      can :create, Purchase 

    elsif user.role? :customer
      # they can read their own profile
      can :show, User do |u|
        u.id == user.id
      end

      # they can update their own profile
      can :edit_current_user, User 

      # they can place new orders
      can :create, Order

      # they can cancel unshipped orders
      can :destroy, Order

      # they can read info about items
      can :read, Item 
      can :boards, Item
      can :pieces, Item
      can :clocks, Item
      can :supplies, Item 

      # they can see list of past orders/order items
      can :read, Order
      can :read, OrderItem

      # they can add schools to the database
      can :create, School

    else
      can :read, :all

      # they can create a customer account
      can :create, User
    end

  end

end


