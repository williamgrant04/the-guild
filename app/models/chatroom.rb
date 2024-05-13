class Chatroom < ApplicationRecord
  belongs_to :guild
  belongs_to :game

  has_many :messages
end
