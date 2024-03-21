require 'rails_helper'

RSpec.describe 'Dashboard' do
  before :each do 
    @list_1 = List.create!(title: 'Test list 1')
    @list_2 = List.create!(title: 'Test list 2')
  end 

  describe 'Dashboard Page' do 
    it 'exists' do 
      visit root_path

      expect(page).to have_content('QwikList')
      expect(page).to have_button('New List')
    end

    it 'has my lists as buttons in descending order of creation' do 
      visit root_path

      expect(page).to have_button(@list_1.title)
      expect(page).to have_button(@list_2.title)

      expect(@list_2.title).to appear_before(@list_1.title)
    end

    it 'routes to a new page to create a list' do 
      visit root_path 

      click_button('New List')
      expect(current_path).to eq(new_list_path)
    end

    it 'routes to a lists show page' do 
      visit root_path 

      click_button(@list_2.title)
      expect(current_path).to eq(list_path(@list_2))
    end
  end
end