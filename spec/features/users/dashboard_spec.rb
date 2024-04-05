require 'rails_helper'

RSpec.describe 'Dashboard' do
  before :each do 
    @user = User.create!(name: 'Karl', email: 'loki_sux69@yahoo.com', password: 'password')
    @list_1 = List.create!(title: 'Test list 1', user_id: @user.id)
    @list_2 = List.create!(title: 'Test list 2', user_id: @user.id)
  end 

  describe 'Dashboard Page' do 
    it 'exists' do 
      visit user_path(@user)

      expect(page).to have_content('QwikList')
      expect(page).to have_content('Your lists')
      expect(page).to have_content('Make a new list')
      expect(page).to have_content('Wanna stay up to date?')
    end

    it 'has my lists as buttons in descending order of creation' do 
      visit user_path(@user)

      expect(page).to have_button(@list_1.title)
      expect(page).to have_button(@list_2.title)

      expect(@list_2.title).to appear_before(@list_1.title)
    end

    it 'routes to a new page to create a list' do 
      visit user_path(@user)

      click_button('New list')
      expect(current_path).to eq(new_user_list_path(@user))
    end

    it 'routes to a lists show page' do 
      visit user_path(@user)

      click_button(@list_2.title)
      expect(current_path).to eq(user_list_path(@user, @list_2))
    end

    it 'logs a user out' do 
      visit user_path(@user)

      expect(page).to have_button('log out')
      click_button('log out')

      expect(current_path).to eq(root_path)
    end

    it 'routes a user to a form page to sign up for updates' do 
      visit user_path(@user)

      expect(page).to have_button('Sign me up')
      click_button('Sign me up')
      expect(current_path).to eq(edit_user_path(@user))
    end
  end
end