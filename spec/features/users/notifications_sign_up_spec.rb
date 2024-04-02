require 'rails_helper'

RSpec.describe 'Notifications' do
  describe 'Sign up Page' do 
    it 'exists' do 
      user = User.create!(name: 'Karl', email: 'loki_sux69@yahoo.com', password: 'password')

      visit(edit_user_path(user))

      expect(page).to have_content('QwikList')
      expect(page).to have_content('Sign up for list idea suggestions...') 
      expect(page).to have_field :phone 
      expect(page).to have_button('sign up')
    end

    it 'signs a user up to recieve text notifications' do 
      user = User.create!(name: 'Karl', email: 'loki_sux69@yahoo.com', password: 'password')

      visit(edit_user_path(user))

      fill_in :phone, with: '812-773-7368'
      click_button('sign up')

      expect(page).to have_button('cancel notifications')
      expect(page).to_not have_button('sign up')

      click_button('home')
      expect(page).to have_button('Manage notifications') 
      expect(page).to_not have_button('Sign me up') 

    end

    it 'cancels a users text notifications' do 
      user = User.create!(name: 'Karl', email: 'loki_sux69@yahoo.com', password: 'password', notifications_on: true)

      visit(edit_user_path(user))
      
      expect(page).to have_button('cancel notifications')
      expect(page).to_not have_button('sign up')

      click_button('cancel notifications')
      expect(page).to have_button('sign up')
      expect(page).to_not have_button('cancel notifications')

      click_button('home')
      expect(page).to have_button('Sign me up') 
      expect(page).to_not have_button('Manage notifications') 
    end
  end 
end 
