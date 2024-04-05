require 'rails_helper'

RSpec.describe List do 
  describe 'validations' do 
    it { should validate_presence_of :title }
  end

  describe 'relationships' do 
    it { should have_many :items }
    it { should belong_to :user }
  end

  describe 'class methods' do 
    it '#desc_order' do 
      user = User.create!(name: 'Karl', email: 'loki_sux69@yahoo.com', password: 'password')
      list_1 = List.create!(title: 'Test list 1', user_id: user.id)
      list_2 = List.create!(title: 'Test list 2', user_id: user.id)
      list_3 = List.create!(title: 'Test list 3', user_id: user.id)

      expect(List.desc_order).to eq([list_3, list_2, list_1])
    end
  end
end