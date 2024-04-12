class TwilioController < ApplicationController
  def notify_users 
    send_dates = Notification.pluck(:send_date)
    if send_dates.indlue?(Date.today)
      Notification.all.find do |event|
        event.send_date == Date.today
        SmsService.new(event).call
      end
    else
      puts 'Hello Wrld'
    end
    # -HURDLES: making this a feature that's a constant check running to determine the date and the holidays dates. 
  end
end
