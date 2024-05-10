class Member < ApplicationRecord
  belongs_to :user
  belongs_to :guild, optional: true
  has_one_attached :profile_image
  has_many :game_members
  has_many :games, through: :game_members

  validates :username, presence: true, uniqueness: true
  validates :profile_image, presence: true

  before_create :set_default_role

  def get_game_member_name(game)
    game_members.find_by(game: game).member_game_name
  end

  private

  def set_default_role
    self.role ||= "member"
  end
end
