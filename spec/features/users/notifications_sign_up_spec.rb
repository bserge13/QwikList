require 'rails_helper'

RSpec.describe 'Notifications' do
  before :each do 
    @user_1 = User.create!(name: 'Karl', email: 'loki_sux69@yahoo.com', password: 'password')
    @user_2 = User.create!(name: 'nova', email: 'loki_sux69@gmail.com', password: 'password', notifications_on: true)
  end

  describe 'Sign up Page' do 
    it 'exists' do 
      visit(edit_user_path(@user_1))

      expect(page).to have_content('QwikList')
      expect(page).to have_content('Sign up for list idea suggestions...') 
      expect(page).to have_field :phone_num 
      expect(page).to have_button('sign up')
    end

    it 'signs a user up to recieve text notifications' do 
      visit(edit_user_path(@user_1))

      fill_in :phone_num, with: '812-773-7368'
      click_button('sign up')

      expect(page).to have_button('cancel notifications')
      expect(page).to_not have_button('sign up')

      click_button('home')
      expect(page).to have_button('Manage notifications') 
      expect(page).to_not have_button('Sign me up') 
    end

    it 'formats phone number inputs into twilio-specific formatting' do 
      visit(edit_user_path(@user_1))

      fill_in :phone_num, with: '(812) 773-7368'
      click_button('sign up')
      expect(page).to have_button('cancel notifications')
      expect(page).to_not have_button('sign up')
      
      click_button('home')
      expect(page).to have_button('Manage notifications') 
      expect(page).to_not have_button('Sign me up') 
    end

    it 'cancels a users text notifications' do 
      visit(edit_user_path(@user_2))
      
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
