class TwilioController < ApplicationController
  def notify_users 
    holidays = HolidayFacade.all_holidays

    if Date.today == holidays.each { |holiday.date| } 
    # Needs to be Date.today - (two weeks out?)
      SmsService.new(body: holiday).call
    end 
  end
end