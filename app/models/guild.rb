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
    self.join_code = loop do
      random_code = SecureRandom.urlsafe_base64(18)
      break random_code unless Guild.exists?(join_code: random_code)
    end
  end
end
