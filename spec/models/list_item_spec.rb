require 'rails_helper'

RSpec.describe ListItem do 
  describe 'relationships' do 
    it { should belong_to :list }
    it { should belong_to :item }
  end 
end