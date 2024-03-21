require 'rails_helper'

RSpec.describe List do 
  describe 'validations' do 
    it { should validate_presence_of :title }
  end

  describe 'relationships' do 
    it { should have_many :list_items }
    it { should have_many(:items).through(:list_items) }
  end
end