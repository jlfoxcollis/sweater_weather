require 'rails_helper'

describe User do
  describe 'validations' do
    it { should validate_presence_of :password }
    it { should validate_uniqueness_of :email }
    it { should have_secure_password }
    it { should have_secure_token :api_key }
  end
end
