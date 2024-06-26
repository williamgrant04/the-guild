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
    create?
  end

  def create?
    user.member.role == "admin"
  end

  def edit?
    update?
  end

  def update?
    user.member.role == "admin"
  end

  def destroy?
    user.member.role == "admin"
  end
end
