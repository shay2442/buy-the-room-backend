class CartRoom < ApplicationRecord
    belongs_to :buyer, class_name: "User", foreign_key: "buyer_id", optional: true
    belongs_to :room

end
