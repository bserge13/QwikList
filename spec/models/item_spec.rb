require 'rails_helper'

RSpec.describe Item do 
  describe 'validations' do 
    it { should validate_presence_of :description }
  end

  describe 'relationships' do 
    it { should belong_to :list }
  end
end