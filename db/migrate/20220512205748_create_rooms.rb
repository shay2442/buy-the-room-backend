class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :image
      t.string :category
      t.string :city
      t.string :state
      t.string :description
      t.float :price
      t.boolean :sold, default: false
      t.references :seller, foreign_keys: { to_table: "users"}
      t.references :buyer, foreign_keys: {to_table: "users"}

      t.timestamps
    end
  end
end
