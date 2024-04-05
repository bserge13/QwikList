# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Notification.create!(event_name:'New Years Eve', event_date: Date.new(2024, 12, 31), send_date: Date.new(2024, 12, 27))
Notification.create!(event_name: 'Martin Luther King Jr Day', event_date: Date.new(2025, 1, 20), send_date: Date.new(2025, 1, 13))
Notification.create!(event_name: 'Memorial Day', event_date: Date.new(2024, 5, 27), send_date: Date.new(2024, 5, 20))
Notification.create!(event_name: 'Black History Month', event_date: Date.new(2025, 2, 1), send_date: Date.new(2025, 1, 29))
Notification.create!(event_name: 'Juneteenth', event_date: Date.new(2024, 6, 19), send_date: Date.new(2024, 6, 12))
Notification.create!(event_name: 'Independence Day', event_date: Date.new(2024, 7, 4), send_date: Date.new(20214, 6, 27))
Notification.create!(event_name: 'Labor Day', event_date: Date.new(2024, 9, 1), send_date: Date.new(20214, 8, 25))
Notification.create!(event_name: "Veterans' Day", event_date: Date.new(2024, 11, 11), send_date: Date.new(2024, 11, 4))
Notification.create!(event_name: 'Thanksgiving', event_date: Date.new(2024, 11, 28), send_date: Date.new(2024, 11, 21))
Notification.create!(event_name: 'Christmas', event_date: Date.new(2024, 12, 25), send_date: Date.new(2024, 12, 18))