class GameMemberPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def create?
    user.member.role == 'admin'
  end

  def new?
    create?
  end

  def update?
    user.member.role == 'admin' || record.member == user.member
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end
end
