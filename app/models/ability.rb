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

      # they can read information related to orders
      can [:read], Order do |o|
        user.id == o.user.id
      end

      # they can update order item
      can [:update], OrderItem do |oi|
        user.id = oi.order.user.id
      end

      # they can read info about items
      can [:read], Item 

    end

  end

end


