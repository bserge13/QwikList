class TwilioController < ApplicationController
  def notify_users 
    DateJob.perform_async
  end
end
