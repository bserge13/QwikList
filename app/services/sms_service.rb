class SmsService
  def initialize(event)
    @body_message = "#{event.event_name} is almost here. May be time for a new list before it gets here!"
    @to_phone_nums = User.notification_numbers
  end
  
  def call 
    client = Twilio::REST::Client.new(TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN)
    @to_phone_nums.each do |phone_num|
      message = client.messages.create(
        body: @body_message,
        from: TWILIO_FROM_NUMBER,
        to: phone_num
      )
      puts "Message SID: #{ message.sid }"
    end
  end

private 

  TWILIO_ACCOUNT_SID = Rails.application.credentials.twilio[:live_sid]
  TWILIO_AUTH_TOKEN =  Rails.application.credentials.twilio[:live_token]

  TWILIO_FROM_NUMBER = Rails.application.credentials.twilio[:app_phone_num]
  TWILIO_TEST_PHONE = Rails.application.credentials.twilio[:test_phone_num] 
end
