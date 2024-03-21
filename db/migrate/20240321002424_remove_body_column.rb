class RemoveBodyColumn < ActiveRecord::Migration[7.1]
  def change
    remove_column :lists, :body, :string  
  end
end
