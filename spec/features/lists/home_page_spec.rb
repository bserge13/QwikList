require 'rails_helper'

RSpec.describe 'Home page' do
  describe 'List' do 
    it 'exists' do 
      list = List.create!(title: 'Test list')
    end
  end
end