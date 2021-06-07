require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    it { should validate_presence_of :full_name }
    it { should validate_presence_of :email }
    it { should validate_presence_of :uid }
    it { should validate_presence_of :avatar_url }
  end

  describe 'class methods' do
    describe '.from_omniauth(auth)' do
      it 'pulls information about a user from omniauth' do
        OmniAuth.config.test_mode = true
        ans = OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new(Faker::Omniauth.google)
        user = User.from_omniauth(ans)
        
        expect(ans.class).to eq(OmniAuth::AuthHash)
        expect(user.full_name).to eq(ans.info.name)
        expect(user.email).to eq(ans.info.email)
        expect(user.uid).to eq(ans.uid)
        expect(user.avatar_url).to eq(ans.info.image)
      end
    end
  end
end
