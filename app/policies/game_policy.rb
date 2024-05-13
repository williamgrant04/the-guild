class GamePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def show?
    user.member.games.any?(record) || user.member.role == "admin" # Admins should be able to see all games
  end

  def new?
    user.member.role == "admin"
  end
end
