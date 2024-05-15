class Guild < ApplicationRecord
  # Before callbacks
  before_validation :generate_code
  before_save :add_owner_as_member

  # associations
  has_many :members
  has_many :games
  has_many :events
  has_one :chatroom, dependent: :destroy

  belongs_to :owner, class_name: 'Member', foreign_key: 'member_id'

  has_one_attached :image
  has_one_attached :icon

  # validations
  validates :name, :join_code, presence: true
  validates :name, uniqueness: true
  validates :join_code, uniqueness: true

  # After callbacks
  after_create :create_chatroom

  protected

  def generate_code
    self.join_code = loop do
      random_code = SecureRandom.urlsafe_base64(18)
      break random_code unless Guild.exists?(join_code: random_code)
    end
  end

  def add_owner_as_member
    self.owner.guild = self
    self.owner.role = "admin"
    self.owner.save
  end

  def create_chatroom
    Chatroom.create(name: self.name, guild: self)
  end
end
