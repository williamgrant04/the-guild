class Guild < ApplicationRecord
  # conditions
  before_validation :generate_code
  # associations
  has_many :members
  has_many :games
  has_many :events
  has_one_attached :image
  has_one_attached :icon
  # validations
  validates :name, :join_code, presence: true
  validates :name, uniqueness: true
  validates :join_code, uniqueness: true

  protected

  def generate_code
    code = SecureRandom.urlsafe_base64(18)
    if Guild.find_by(join_code: code)
      code = SecureRandom.urlsafe_base64(18)
    end
    self.join_code = code
  end
end
