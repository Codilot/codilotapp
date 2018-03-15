class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
    
    alias_action  :read, to: :product_allowed_actions
    alias_action  :read, to: :article_allowed_actions
    alias_action  :create, :read, :show, to: :comment_allowed_actions
    alias_action  :create, :read, :show, :update, :destroy, to: :order_allowed_actions

    user ||= User.new # guest user (not logged in)
    if user.present?  # permissions logged in users
      can :manage, User, id: user.id
      can :product_allowed_actions, Product
      can :product_allowed_actions, Article
      can :comment_allowed_actions, Comment
      can :order_allowed_actions, Order, user_id: user.id
      if user.admin?  # additional permissions for administrators
        can :manage, :all
      end
    else # guest user permissions
      can :product_allowed_actions, Product
      can :product_allowed_actions, Article
    end
  end
end
