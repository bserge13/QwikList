class AddColumnPhoneNumToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :phone_num, :string, default: nil 
  end
end
