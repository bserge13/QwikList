require 'rails_helper'

RSpec.describe 'Lists' do
  before :each do 
    @list_1 = List.create!(title: 'Test list 1')
    @list_2 = List.create!(title: 'Test list 2')
  end 

  describe 'List Show Page' do 
    it 'exists' do 
      visit list_path(@list_2)

      expect(page).to have_content('QwikList')
      expect(page).to have_content('Test list 2')
      expect(page).to have_field :item
      expect(page).to have_button('Add item')
    end 
  end 
end 