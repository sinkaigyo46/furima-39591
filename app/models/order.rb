class Order
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :city_town, :street_number, :building_name, :phone_number, :prefecture_id,
                :token

  with_options presence: true do
    validates :user_id, :item_id, :city_town, :street_number, :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid. 10 to 11 digits of half-width numbers' }
  end

  def save
    shipping = Shipping.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, city_town: city_town, street_number: street_number,
                           building_name: building_name, phone_number: phone_number, prefecture_id: prefecture_id, shipping_id: shipping.id)
  end
end
