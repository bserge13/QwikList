require 'rails_helper'

RSpec.describe List do 
  describe 'validations' do 
    it { should validate_presence_of :title }
    it { should validate_presence_of :body }
  end
end