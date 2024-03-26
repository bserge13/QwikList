module Twilio
  class SmsService
    TEST_ACCOUNT_SID = Rails.application.credentials.twilio[:test_sid]
    TEST_AUTH_TOKEN =  Rails.application.credentials.twilio[:test_token]
    
    TWILIO_ACCOUNT_SID = Rails.application.credentials.twilio[:live_sid]
    TWILIO_AUTH_TOKEN =  Rails.application.credentials.twilio[:live_token]
  
    TWILIO_FROM_NUMBER = Rails.application.credentials.twilio[:app_phone_num]
                              # will go in credentials
    TWILIO_TEST_PHONE = ('waiting on account verification') 
                              # will go in credentials

    def initialize(body, to_phone_num)
      @body = body
      @to_phone_num = to_phone_num
    end
    
    def call 
      client = Twilio::REST::Client.new(TEST_ACCOUNT_SID, TEST_AUTH_TOKEN)
      message = client.messages.create(
        body: @body,
        # "#{holiday.event} is just around the block! Might need a shopping list?",
        from: TWILIO_FROM_NUMBER,
        to: @to_phone_num
      )
      puts message.sid 
    end

    private 

    def to(to_phone_num)
      return TWILIO_TEST_PHONE if Rails.env.development?

      to_phone_num
    end
  end
end