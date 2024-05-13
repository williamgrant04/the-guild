class Chatroom < ApplicationRecord
  belongs_to :guild
  belongs_to :game, optional: true

  has_many :messages
end
