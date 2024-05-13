class Game < ApplicationRecord
  belongs_to :guild

  has_many :game_members
  has_many :members, through: :game_members
  has_many :events
  has_one :chatroom
  has_one_attached :game_banner
  has_one_attached :game_icon

  validates :name, uniqueness: { scope: :guild_id }
  validates :game_icon, :name, presence: true

  after_create :create_chatroom

  private

  def create_chatroom
    Chatroom.create(name: self.name, game: self)
  end
end
