class User < ApplicationRecord
  validates :full_name, presence: true
  validates :email, presence: true #, uniqueness: true
  validates :uid, presence: true
  validates :avatar_url, presence: true

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_initialize do |user|
      user.full_name = auth.info.name
      user.email = auth.info.email
      user.uid = auth.uid
      user.avatar_url = auth.info.image
    end
  end
end
