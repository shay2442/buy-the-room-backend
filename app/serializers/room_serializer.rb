class RoomSerializer < ActiveModel::Serializer
  attributes :id, :image, :category, :city, :state, :price, :description, :sold, :items
  has_one :seller
  has_one :buyer
  has_many :comments
end
