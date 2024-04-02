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
end 