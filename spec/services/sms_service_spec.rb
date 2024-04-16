require 'rails_helper'

RSpec.describe SmsService do 
  describe 'Twilio notification services' do
    xit 'exists', :vcr do 
      holiday = Notification.create!(event_name: '420', event_date: Date.new(2024, 4, 20), send_date: Date.new(2024, 4, 5)) 
      User.create!(name: 'Blake', email: 'loki_rox69@yahoo.com', password: 'password', notifications_on: true, phone_num: "+18127737368")
      User.create!(name: 'Mom', email: 'gigi@yahoo.com', password: 'password', notifications_on: true, phone_num: "+18127607295")
      User.create!(name: 'Karl', email: 'loki_sux69@yahoo.com', password: 'password')
      SmsService.new(holiday).call 
    end
  end
end