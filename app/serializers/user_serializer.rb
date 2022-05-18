class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email

  has_many :sold_rooms
  has_many :purchased_rooms
end
