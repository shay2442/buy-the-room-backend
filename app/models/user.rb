class User < ApplicationRecord
    has_secure_password
    has_many :cart_rooms
    has_many :purchased_rooms, class_name: 'Room', foreign_key: 'buyer_id', dependent: :destroy, through: :cart_rooms
    has_many :sold_rooms, class_name: 'Room', foreign_key: 'seller_id', through: :cart_rooms
    has_many :comments, dependent: :destroy

    validates :username, presence: true, uniqueness: true
end
