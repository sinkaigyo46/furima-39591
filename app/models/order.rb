class Order
  include ActiveModel::Model
   attr_accessor :user, :item, :postal_code, :city_town, :street_number, :building_name, :phone_number, :shipping, :prefecture_id, :token
  
   with_options presence: true do
    validates :item, :user, :city_town, :street_number, :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :phone_number, format: { with: /\A\d{10,11}\z/,message: "is invalid. Include hyphen(-)"}
   end
  

  def save
    user = User.find_by(id: self.user)
    item = Item.find_by(id: self.item)
   shipping = Shipping.create(user: user, item: item)
   ShippingAddress.create(postal_code: postal_code, city_town: city_town, street_number: street_number, building_name: building_name, phone_number: phone_number, prefecture_id: prefecture_id, shipping: shipping)
  end
end