class User < ApplicationRecord
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_presence_of :password, require: true
  has_secure_password
  has_secure_token :api_key

  after_save
  validates_presence_of :api_key
end