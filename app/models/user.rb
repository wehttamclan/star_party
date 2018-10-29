class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true
  validates_presence_of :password, require: true

  validates_presence_of :name,
                        :email,
                        :phone_number,
                        :zip_code

  has_secure_password

  enum role: %w(user admin)
end
