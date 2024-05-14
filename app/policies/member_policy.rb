class MemberPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def edit?
    update?
  end

  def update?
    # Only the guild owner can edit the member
    user.member.role == 'admin' || record == current.user.member
  end
end
