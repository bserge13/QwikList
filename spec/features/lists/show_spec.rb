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
      expect(page).to have_field :description
      expect(page).to have_button('add item')
    end 

    it 'adds items to a list' do 
      visit list_path(@list_2)
      expect(page).to_not have_content('Dairy free cheese')

      fill_in :description, with: 'Dairy free cheese'
      click_button('add item')
      expect(page).to have_content('Dairy free cheese')
    end
  end 
end 