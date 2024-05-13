class User < ApplicationRecord
  attr_accessor :member_details
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_one :member, dependent: :destroy

  after_create :create_member

  private

  def create_member
    m = Member.new(username: member_details[:username], user: self)
    if member_details[:profile_image].present?
      m.profile_image = member_details[:profile_image]
    else
      # This is because a profile image is required
      m.profile_image.attach io: File.open("#{Rails.root}/app/assets/images/50.png"), filename: "default_profile_image.png", content_type: "image/png"
    end
    m.save
  end
end
