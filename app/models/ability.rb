class Ability
  include CanCan::Ability

  def initialize(account)
      account||= Account.new # guest user (not logged in)
      if user.has_role? :admin
        can :manage, :all
      else
        can :read, :all
      end

  end
end
