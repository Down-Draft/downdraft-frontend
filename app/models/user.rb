class User < ApplicationRecord
  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_initialize do |user|
      user.full_name = auth.info.name
      user.email = auth.info.email
      user.uid = auth.uid
      user.avatar_url = auth.info.image
    end
  end
end
