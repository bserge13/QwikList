require 'rails_helper'

RSpec.describe 'Lists' do
  describe 'New List Page' do 
    it 'exists' do 
      visit new_list_path 

      expect(page).to have_content('QwikList')
      expect(page).to have_content('Create a new list')
      expect(page).to have_button('home')

      expect(page).to have_field :title
      expect(page).to have_button('create')
    end

    it 'creates a new list and routes back to the dashboard page' do 
      visit new_list_path 

      fill_in :title, with: 'Grocery list'
      click_button('create')

      new_list = List.last 
      expect(current_path).to eq(list_path(new_list))

      expect(page).to have_content('QwikList')
      expect(page).to have_content('Grocery list')
      expect(page).to have_button('add item')
    end

    it 'sad path- flashes an error for an empty field' do 
      visit new_list_path 

      click_button('create')
      expect(current_path).to eq(new_list_path)
      expect(page).to have_content("A list must have a 'Title' to be created")
    end
  end
end 