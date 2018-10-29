class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, require: true

  validates_presence_of :name,
                        :email

  has_secure_password

  def self.create_with_omniauth(auth)
    create! do |user|
      user.name     = auth[:info][:name]
      user.email    = auth[:info][:email]
      user.password = auth[:uid]
    end
  end

end
