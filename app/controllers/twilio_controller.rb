class TwilioController < ApplicationController
  def notify_users 
    # holidays = HolidayFacade.all_holidays
    
    # holidays.each do |holiday|
    # if Date.today == holiday.date 
    #   SmsService.new(holiday).call
    # end 
    
    
    # -all_holidays will be a facade method that returns an array of holiday objects 
    # -holidays needs to be an array of holiday objects a holiday should have a date and title
    
    # -HURDLES: making this a feature that's a constant check running to determine the date and the holidays dates. 
  end
end