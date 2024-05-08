class GuildPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def show?
    user.member.guild == record
  end

  def new?
    create?
  end

  def create?
    # Anyone can create a guild
    true
  end

  def edit?
    update?
  end

  def update?
    # Only the guild owner can edit the guild
    user.member == record.owner
  end
end
