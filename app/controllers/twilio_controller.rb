class TwilioController < ApplicationController
  def notify_users 
    holidays = HolidayFacade.all_holidays
    
    # holidays.each do |holiday|
    # if Date.today.month == holiday.month_numeric 
    #   SmsService.new(holiday).call
    # end 
    
    
    # -all_holidays will be a facade method that returns an array of holiday objects 
    # -holidays needs to be an array of holiday objects a holiday should have a date and title
    
    # -HURDLES: making this a feature that's a constant check running to determine the date and the holidays dates. 
  end
end

# class HolidayFacade 
#   def self.all_holidays  
#     holiday_collection = HolidayService.get_holidays.map do |data|
#       Holiday.new(data)
#     end
#     holidays = holiday_collection.pluck(:send_date)
#     today = Date.today.strftime('%Y/%m/%d') 

#     if holidays.include?(today)
#       holiday_collection.find do |holiday| 
#         holiday.send_date == today
#         SmsService.new(holiday).call 
#       end
#     end 
#   end
# end