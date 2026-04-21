class User < ApplicationRecord
  has_secure_password
  has_many :entries

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 50 }
end
