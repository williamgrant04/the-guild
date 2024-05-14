class EventPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    user.member.guild == record.guild
  end

  def new?
    create?
  end

  def create?
    # Only the owner of the guild can create an event
    user.member.role == 'admin'
  end

  def edit?
    update?
  end

  def update?
    # Only the owner of the guild can edit the event
    user.member.role == 'admin'
  end

  def destroy?
    update?
  end
end
