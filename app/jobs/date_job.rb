class DateJob < ApplicationJob
  include Sidekiq::Job

  def perform
    send_dates = Notification.pluck(:send_date)
    if send_dates.include?(Date.today)
      notifications = Notification.where(send_date: Date.today)
      notifications.each do |event|
        SmsService.new(event).call
      end
    end  
  end
end
