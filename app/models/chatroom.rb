class Chatroom < ApplicationRecord
  belongs_to :guild, optional: true
  belongs_to :game, optional: true

  has_many :messages
end
