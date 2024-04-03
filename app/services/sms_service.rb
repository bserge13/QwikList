class SmsService
  TWILIO_ACCOUNT_SID = Rails.application.credentials.twilio[:live_sid]
  TWILIO_AUTH_TOKEN =  Rails.application.credentials.twilio[:live_token]
  
  TWILIO_FROM_NUMBER = Rails.application.credentials.twilio[:app_phone_num]
  TWILIO_TEST_PHONE = Rails.application.credentials.twilio[:test_phone_num] 

  def initialize(holiday)
    @body_message = "#{holiday.title} is just "
    @to_phone_num = User.notification_numbers
  end
  
  def call 
    client = Twilio::REST::Client.new(TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN)
    message = client.messages.create(
      body: @body_message,
        # "#{holiday.event} is just around the block! Might need a shopping list?",
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

# Twilio::SmsService.new(body: 'hello world!', to_phone_num: User.all_phones).call 
# The above could go into a new holiday facade to pull in info from an external api for upcoming holidays 