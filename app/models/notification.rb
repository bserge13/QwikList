class Notification < ApplicationRecord
  validates :event_name, :event_date, :send_date, presence: true
end