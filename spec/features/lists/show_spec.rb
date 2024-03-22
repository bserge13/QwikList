require 'rails_helper'

RSpec.describe 'Lists' do
  before :each do 
    @list_1 = List.create!(title: 'Test list 1')
    @list_2 = List.create!(title: 'Test list 2')

    @cheese = Item.create!(description: 'dairy free cheese', list_id: @list_1.id)
    @milk = Item.create!(description: 'almond milk', list_id: @list_1.id)
    @ghost = Item.create!(description: 'ghost drinks', list_id: @list_1.id)
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

    it 'removes an item from a list' do 
      visit list_path(@list_1)
      expect(page).to have_content(@cheese.description)
      expect(page).to have_content(@milk.description)
      expect(page).to have_content(@ghost.description)

      within "#item-#{@ghost.id}" do 
        expect(page).to have_button('remove')
        click_button('remove')
      end

      expect(page).to_not have_content(@ghost.description)
    end
  end 
end 