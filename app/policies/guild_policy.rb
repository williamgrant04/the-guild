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
    # Anyone can create a guild, except for users who are already in a guild
    user.member.guild == nil
  end

  def edit?
    update?
  end

  def update?
    # Only the guild owner can edit the guild
    user.member == record.owner
  end

  def invite?
    # Only users who aren't already in guilds can accept invites
    user.member.guild == nil
  end
end
