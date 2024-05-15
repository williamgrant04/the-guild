class Game < ApplicationRecord
  belongs_to :guild

  has_one :chatroom, dependent: :destroy
  has_many :game_members, dependent: :destroy
  has_many :members, through: :game_members
  has_many :events, dependent: :destroy

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
