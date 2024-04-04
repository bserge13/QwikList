class SmsService
  TWILIO_ACCOUNT_SID = Rails.application.credentials.twilio[:live_sid]
  TWILIO_AUTH_TOKEN =  Rails.application.credentials.twilio[:live_token]
  
  TWILIO_FROM_NUMBER = Rails.application.credentials.twilio[:app_phone_num]
  TWILIO_TEST_PHONE = Rails.application.credentials.twilio[:test_phone_num] 

  def initialize(holiday)
    @body_message = "#{holiday.title} is this month. May be time for a new leading up to it!"
    @to_phone_num = User.notification_numbers
  end
  
  def call 
    client = Twilio::REST::Client.new(TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN)
    message = client.messages.create(
      body: @body_message,
      from: TWILIO_FROM_NUMBER,
      to: to(@to_phone_num)
    )
    puts message.sid 
  end

  private 

  def to(to_phone_num)
    return TWILIO_TEST_PHONE if Rails.env.development?

    to_phone_num
  end
end
