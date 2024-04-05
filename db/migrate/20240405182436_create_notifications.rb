class CreateNotifications < ActiveRecord::Migration[7.1]
  def change
    create_table :notifications do |t|
      t.string :event_name
      t.date :event_date
      t.date :send_date

      t.timestamps
    end
  end
end
