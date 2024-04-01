require 'rails_helper'

RSpec.describe 'Lists' do
  before :each do 
    @user = User.create!(name: 'Karl', email: 'loki_sux69@yahoo.com', password: 'password')
    @list_1 = List.create!(title: 'Test list 1', user_id: @user.id)
    @list_2 = List.create!(title: 'Test list 2', user_id: @user.id)
  end 

  describe 'List Show Page' do 
    it 'exists' do 
      visit user_list_path(@user, @list_2)
      
      expect(page).to have_content('QwikList')
      expect(page).to have_content('Test list 2')
      expect(page).to have_button('home')
      
      expect(page).to have_field :description
      expect(page).to have_button('add item')
      
      expect(page).to have_button('delete list')
    end 
    
    it 'has a home button that reroutes back to the dashboard' do 
      visit user_list_path(@user, @list_2)
  
      expect(page).to have_button('home')
  
      within "#home_button" do 
        click_button('home')
      end
  
      expect(current_path).to eq(user_path(@user))
    end

    it 'has a delete button' do 
      visit user_list_path(@user, @list_1)

      expect(page).to have_button('delete list')
    end
  end 
end 