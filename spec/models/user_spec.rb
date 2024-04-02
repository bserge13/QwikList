require 'rails_helper'

RSpec.describe User do 
  describe 'validations' do 
    it { should validate_presence_of :email }
    it { should validate_presence_of :name }
    it { should validate_presence_of :password }
    it { should validate_uniqueness_of :email }
    it { should allow_value(true).for(:notifications_on) }
    it { should allow_value(false).for(:notifications_on) }
  end

  describe 'relationships' do 
    it { should have_many :lists }
  end

  describe 'model methods' do 
    it '#notification_numbers' do 
      user_1 = User.create!(name: 'Karl', email: 'loki_sux69@yahoo.com', password: 'password')
      user_2 = User.create!(name: 'loki', email: 'karl_sux69@gmail.com', password: 'password', notifications_on: true, phone_num: '+11234567890')
      user_3 = User.create!(name: 'nova', email: 'loki_sux1@gmail.com', password: 'password', notifications_on: true, phone_num: '+14567890123')
      user_4 = User.create!(name: 'bexley', email: 'brudder_smells@yahoo.com', password: 'password', notifications_on: true, phone_num: '+17890123456')
      user_5 = User.create!(name: 'cowboy', email: 'seester_stinks@aol.com', password: 'password')

      expect(User.notification_numbers).to eq([user_2.phone_num, user_3.phone_num, user_4.phone_num])
    end
  end
end 