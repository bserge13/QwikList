require 'rails_helper'

RSpec.describe 'Lists' do
  before :each do 
    @user = User.create!(name: 'Karl', email: 'loki_sux69@yahoo.com', password: 'password')
  end
  describe 'New List Page' do 
    it 'exists' do 
      visit new_user_list_path(@user)

      expect(page).to have_content('QwikList')
      expect(page).to have_content('Create a new list')
      expect(page).to have_button('home')

      expect(page).to have_field :title
      expect(page).to have_button('create')
    end

    it 'creates a new list and routes back to the dashboard page' do 
      loki = User.create!(name: 'Loki', email: 'karl_sux69@gmail.com', password: 'password1')
      visit new_user_list_path(loki)

      fill_in :title, with: 'movie list'
      click_button('create')

      new_list = List.last 
      
      expect(current_path).to eq(user_list_path(loki, new_list))

      expect(page).to have_content('QwikList')
      expect(page).to have_content('movie list')
      expect(page).to have_button('add item')
    end

    it 'sad path- flashes an error for an empty field' do 
      visit new_user_list_path(@user)

      click_button('create')
      expect(current_path).to eq(new_user_list_path(@user))
      expect(page).to have_content("A list must have a 'Title' to be created")
    end
  end
end 