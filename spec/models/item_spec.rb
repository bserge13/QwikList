require 'rails_helper'

RSpec.describe Item do 
  describe 'validations' do 
    it { should validate_presence_of :description }
  end

  describe 'relationships' do 
    it { should have_many :list_items }
    it { should have_many(:lists).through(:list_items) }
  end
end