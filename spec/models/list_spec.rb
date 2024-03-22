require 'rails_helper'

RSpec.describe List do 
  describe 'validations' do 
    it { should validate_presence_of :title }
  end

  describe 'relationships' do 
    it { should have_many :items }
  end

  describe 'Calss methods' do 
    it '#desc_order' do 
      list_1 = List.create!(title: 'Test list 1')
      list_2 = List.create!(title: 'Test list 2')
      list_3 = List.create!(title: 'Test list 3')

      expect(List.desc_order).to eq([list_3, list_2, list_1])
    end
  end
end