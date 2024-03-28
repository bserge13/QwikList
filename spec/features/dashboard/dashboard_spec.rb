require 'rails_helper'

RSpec.describe 'Dashboard' do
  before :each do 
    @user = User.create!(name: 'Karl', email: 'loki_sux69@yahoo.com', password: 'password')
    @list_1 = List.create!(title: 'Test list 1', user_id: @user.id)
    @list_2 = List.create!(title: 'Test list 2', user_id: @user.id)
  end 

  describe 'Dashboard Page' do 
    it 'exists' do 
      visit root_path

      expect(page).to have_content('QwikList')
      expect(page).to have_button('New list')
    end

    it 'has my lists as buttons in descending order of creation' do 
      visit root_path

      expect(page).to have_button(@list_1.title)
      expect(page).to have_button(@list_2.title)

      expect(@list_2.title).to appear_before(@list_1.title)
    end

    it 'routes to a new page to create a list' do 
      visit root_path 

      click_button('New list')
      expect(current_path).to eq(new_list_path)
    end

    it 'routes to a lists show page' do 
      visit root_path 

      click_button(@list_2.title)
      expect(current_path).to eq(list_path(@list_2))
    end
  end
end