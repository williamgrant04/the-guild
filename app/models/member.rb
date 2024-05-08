class Member < ApplicationRecord
  belongs_to :user
  belongs_to :guild, optional: true
  has_one_attached :profile_image

  validates :username, presence: true, uniqueness: true
  validates :profile_image, presence: true

  before_create :set_default_role

  private

  def set_default_role
    self.role ||= "member"
  end
end
