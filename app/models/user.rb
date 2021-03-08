class User < ApplicationRecord
  validates_uniqueness_of :email
  has_secure_token :api_key

  before_save
    :password == :password_confirmation
end