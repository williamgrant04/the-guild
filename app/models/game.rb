class Game < ApplicationRecord
  belongs_to :guild

  has_many :game_members
  has_many :events
  has_one_attached :game_banner
  has_one_attached :game_icon

  validates :name, uniqueness: true
  validates :game_icon, presence: true
end
