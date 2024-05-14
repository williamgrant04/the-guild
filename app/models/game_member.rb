class GameMember < ApplicationRecord
  # associations
  belongs_to :member
  belongs_to :game
  # validations
  validates :details, :member_game_name, presence: true
  validates :member_game_name, uniqueness: { case_sensitive: true, scope: :game_id }
  validates :details, length: { maximum: 200, too_long: "%<count>s characters is the maximum allowed" }
  validates :member_game_name, length: { minimum: 3, too_short: "%<count>s characters is the minimum allowed" }
  validates :member_id, uniqueness: { scope: :game_id }
end
