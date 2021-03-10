require 'rails_helper'

describe User do
  describe 'validations' do
    it { should validate_presence_of :password }
    it { should validate_uniqueness_of :email }
  end
end
