require 'rails_helper'

RSpec.describe 'Items' do
  before :each do 
    @list_2 = List.create!(title: 'Test list 2')
  end 

  describe 'List Items' do
    it 'adds items to a list' do 
      visit list_path(@list_2)
      expect(page).to_not have_content('Dairy free cheese')

      fill_in :description, with: 'Dairy free cheese'
      click_button('add item')
      expect(page).to have_content('Dairy free cheese')
    end
  end
end 