require 'rails_helper'

RSpec.describe Notification do 
  describe 'validations' do 
    it { should validate_presence_of :event_name }
    it { should validate_presence_of :event_date }
    it { should validate_presence_of :send_date }
  end
end 