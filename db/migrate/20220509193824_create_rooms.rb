class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :image
      t.string :category
      t.string :city
      t.string :state
      t.string :description
      t.float :price
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
