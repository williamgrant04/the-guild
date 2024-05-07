class Guild < ApplicationRecord
  # conditions
  before_save :generate_code
  # relations
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
    self.code = loop do
      random_code = SecureRandom.urlsafe_base64(nil, false)
      break random_code unless Guild.exists?(code: random_code)
    end
  end
end
