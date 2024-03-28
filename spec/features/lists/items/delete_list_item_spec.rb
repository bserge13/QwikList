require 'rails_helper'

RSpec.describe 'Lists' do
  before :each do 
    @user = User.create!(name: 'Karl', email: 'loki_sux69@yahoo.com', password: 'password')
    @list_1 = List.create!(title: 'Test list 1', user_id: @user.id)

    @cheese = Item.create!(description: 'dairy free cheese', list_id: @list_1.id)
    @milk = Item.create!(description: 'almond milk', list_id: @list_1.id)
    @ghost = Item.create!(description: 'ghost drinks', list_id: @list_1.id)
  end 

  describe 'List Items' do
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