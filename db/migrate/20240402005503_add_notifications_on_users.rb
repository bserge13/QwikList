class AddNotificationsOnUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :notifications_on, :boolean, default: false 
  end
end
