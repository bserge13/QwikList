require 'rails_helper'

RSpec.describe 'Login page' do 
  describe 'Landing page for QwikList' do 
    it 'exists' do 
      visit root_path

      expect(page).to have_content('QwikList')
      expect(page).to have_content('Make lists. Plain & simple, quick & easy')
      expect(page).to have_button('sign up')

      expect(page).to have_field :email
      expect(page).to have_field :password 
      expect(page).to have_button('login')
    end

    it 'logs an existing user in' do 
      user = User.create!(name: 'Karl', email: 'loki_sux69@yahoo.com', password: 'password')
      visit root_path

      fill_in :email, with: 'loki_sux69@yahoo.com'
      fill_in :password, with: 'password'
      click_button('login')
    end

    it 'sad path- flashes message for incorrect credentials: email' do 
      user = User.create!(name: 'Karl', email: 'loki_sux69@yahoo.com', password: 'password')
      visit root_path

      fill_in :email, with: 'loki_rox69@gmail.com'
      fill_in :password, with: 'password'
      click_button('login')

      expect(page).to have_content("Uh oh, your login info doesn't seem to match our records. Wanna try again?")
    end

    it 'sad path- flashes message for incorrect credentials: password' do 
      user = User.create!(name: 'Karl', email: 'loki_sux69@yahoo.com', password: 'password')
      visit root_path

      fill_in :email, with: 'loki_sux69@yahoo.com'
      fill_in :password, with: 'password1'
      click_button('login')

      expect(page).to have_content("Uh oh, your login info doesn't seem to match our records. Wanna try again?")
    end

    it 'redirects a user to a form to sign up' do 
      visit root_path

      click_button('sign up')
      expect(current_path).to eq(new_user_path)
    end
  end
end

# <%= f.text_field :name, placeholder: "John Doe" %>
# <%= f.text_field :email, placeholder: "john1@gmail.com" %>
# <%= f.password_field :password, placeholder: "password" %>
# <%= f.password_field :password_confirmation, placeholder: "password confirmation", required: true %>

# <%= f.submit "login", class: "btn btn-success" %>
# <% end %></p>
