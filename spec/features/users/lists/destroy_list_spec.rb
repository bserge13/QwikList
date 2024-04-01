require 'rails_helper'

RSpec.describe 'Lists' do
  before :each do 
    @user = User.create!(name: 'Karl', email: 'loki_sux69@yahoo.com', password: 'password')
    @list_1 = List.create!(title: 'Test list 1', user_id: @user.id)
    @list_2 = List.create!(title: 'Test list 2', user_id: @user.id)
  end 

  describe 'List Show Page' do 
    it 'deletes a list' do 
      visit user_list_path(@user, @list_1)

      expect(page).to have_button('delete list')

      within "#red_button" do 
        click_button('delete list')
      end

      expect(current_path).to eq(user_path(@user))
      expect(page).to_not have_button(@list_1.title)
    end
  end 
end 