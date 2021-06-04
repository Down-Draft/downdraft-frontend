require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    it { should validate_presence_of :full_name }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :uid }
    it { should validate_presence_of :avatar_url }
  end
end
