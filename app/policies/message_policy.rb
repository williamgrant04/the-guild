class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def create?
    user.member.guild == record.chatroom.guild || user.member.guild == record.chatroom.game.guild # This is stupid but it works
  end
end
