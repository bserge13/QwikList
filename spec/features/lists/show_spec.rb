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
      expect(page).to have_button('home')
      
      expect(page).to have_field :description
      expect(page).to have_button('add item')
      
      expect(page).to have_button('delete list')
    end 
    
    it 'has a home button that reroutes back to the dashboard' do 
      visit list_path(@list_2)
  
      expect(page).to have_button('home')
  
      within "#home_button" do 
        click_button('home')
      end
  
      expect(current_path).to eq(root_path)
    end

    it 'deletes a list' do 
      visit list_path(@list_1)

      expect(page).to have_button('delete list')

      within "#red_button" do 
        click_button('delete list')
      end

      expect(current_path).to eq(root_path)
      expect(page).to_not have_button(@list_1.title)
    end
  end 
end 