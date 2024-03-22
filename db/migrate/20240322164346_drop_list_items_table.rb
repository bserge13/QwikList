class DropListItemsTable < ActiveRecord::Migration[7.1]
  def change
    drop_table :list_items
  end
end
