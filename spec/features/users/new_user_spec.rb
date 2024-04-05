require 'rails_helper'

RSpec.describe 'Sign up page' do 
  describe 'Sign up page for QwikList account' do 
    it 'exists' do 
      visit '/register'

      expect(page).to have_content('QwikList')
      expect(page).to have_content('Make lists. Plain & simple, quick & easy')
      expect(page).to have_content('Sign up')

      expect(page).to have_field :name
      expect(page).to have_field :email
      expect(page).to have_field :password
      expect(page).to have_field :password_confirmation 
    end

    it 'creates a new user account' do 
      visit '/register'

      fill_in :name, with: 'Blake'
      fill_in :email, with: 'veggie_straw@yahoo.com'
      fill_in :password, with: 'password'
      fill_in :password_confirmation, with: 'password'
      click_button('Submit')
      
      new_user = User.last 
      
      expect(current_path).to eq(user_path(new_user))
    end

    it 'sad path- using same email' do 
      user = User.create!(name: 'Blake', email: 'veggie_straw@yahoo.com', password: 'password')

      visit '/register'

      fill_in :name, with: 'Eric'
      fill_in :email, with: 'veggie_straw@yahoo.com'
      fill_in :password, with: 'password'
      fill_in :password_confirmation, with: 'password'
      click_button('Submit')
      
      expect(current_path).to eq('/register')
      expect(page).to have_content('Looks like that email is already in use. Wanna try again?')
    end
  end
end