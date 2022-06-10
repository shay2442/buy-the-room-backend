class Room < ApplicationRecord
  belongs_to :seller, class_name: "User", foreign_key: "seller_id"
  belongs_to :buyer, class_name: "User", foreign_key: "buyer_id", optional: true
  has_many :comments, dependent: :destroy
  has_many :images, dependent: :destroy
  
  validates :category, presence: true
  validates :price, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/, message: "Must be dollar amount" }, numericality: { greater_than: 0, less_than: 5000000 }
  # validates :price, presence: true, numericality: { greater_than: 0, less_than: 5000000 }
end
