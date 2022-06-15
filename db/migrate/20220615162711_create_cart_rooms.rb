class CreateCartRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :cart_rooms do |t|
      t.integer :room_id
      t.integer :buyer_id

      t.timestamps
    end
  end
end
