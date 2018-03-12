require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe 'associations' do
  end

  describe 'class methods' do
    it 'should find a user by its credentials' do
      credentials = {username: Faker::HeyArnold.character, password: 'abcdef'}
      User.create!(credentials)
      user = User.find_by_credentials(credentials)
      expect(user.username).to eq(Faker::HeyArnold.character)
    end

    # it 'should raise error if user does not exist' do
    #   credentials = {username: Faker::HeyArnold.character, password: 'abcdef'}
    #   user = User.find_by_credentials(credentials)
    #   expect(user.errors).to eq(Faker::HeyArnold.character)
    # end
  end

  describe 'password encryption' do
    it 'does not save passwords to database' do
      User.create!(username: Faker::HeyArnold.character, password: 'abcdef')
      user = User.find_by(username: Faker::HeyArnold.character)
      expect(user.password).not_to eq('abcdef')
    end

    it 'encrypts the password using BCrypt' do
      user_params = {username: Faker::HeyArnold.character, password: 'abcdef'}
      expect(BCrypt::Password).to receive(:create).with(user_params.password)
      User.new(user_params)
    end
  end

  describe 'session token' do
    it 'assigns a session token if one is not given' do
      arnold = User.create!(username: Faker::HeyArnold.character, password: 'abcdef')
      expect(arnold.session_token).not_to be_nil
    end
  end
end
