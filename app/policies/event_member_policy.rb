class EventMemberPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def create?
    # Only members of a guild can create an event member
    user.member.guild == record.event.guild || user.member.guild == record.event.game.guild # God this sucks
  end

  def destroy?
    user.member.guild == record.event.guild
  end
end
