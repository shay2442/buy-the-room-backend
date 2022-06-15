class RemoveBuyerIdFromRooms < ActiveRecord::Migration[7.0]
  def change
    remove_column :rooms, :buyer_id, :integer
  end
end
