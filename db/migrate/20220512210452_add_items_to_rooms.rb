class AddItemsToRooms < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :items, :text
  end
end
