require 'rails_helper'

RSpec.describe 'List' do
  before :each do 
    @list_1 = List.create!(title: 'Test list 1')
    @list_2 = List.create!(title: 'Test list 2')
  end 

  describe 'Dashboard' do 
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
  end
end