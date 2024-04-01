require 'rails_helper'

RSpec.describe 'Items' do
  before :each do 
    @user = User.create!(name: 'Karl', email: 'loki_sux69@yahoo.com', password: 'password')

    @list_2 = List.create!(title: 'Test list 2', user_id: @user.id)
  end 

  describe 'List Items' do
    it 'adds items to a list' do 
      visit user_list_path(@user, @list_2)
      expect(page).to_not have_content('Dairy free cheese')

      fill_in :description, with: 'Dairy free cheese'
      click_button('add item')
      expect(page).to have_content('Dairy free cheese')
    end
  end
end 