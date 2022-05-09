class RoomSerializer < ActiveModel::Serializer
  attributes :id, :image, :category, :city, :state, :description, :price
  has_one :user
end
