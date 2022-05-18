class RoomSerializer < ActiveModel::Serializer
  attributes :id, :image, :category, :city, :state, :price, :description, :sold, :items, :status
  has_one :seller
  has_one :buyer
  has_many :comments

  def price 
    "$#{'%.2f' % self.object.price}" 
  end


  def status 
    if self.object.sold 
      "Sold"
    else 
      "Buy Now"
    end
  end
end
