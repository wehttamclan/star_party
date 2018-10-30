class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, require: true

  validates_presence_of :name,
                        :email

  has_many :parties, dependent: :destroy
  has_many :user_parties, dependent: :destroy
  has_many :parties, through: :user_parties, dependent: :destroy

  has_secure_password

  enum role: %w(user admin)

  def self.create_with_omniauth(auth)
    create! do |user|
      user.name     = auth[:info][:name]
      user.email    = auth[:info][:email]
      user.password = auth[:uid]
    end
  end


end
