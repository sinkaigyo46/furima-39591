class Order
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :city_town, :street_number, :building_name, :phone_number, :prefecture_id,
                :token

  with_options presence: true do
    validates :token,:user_id, :item_id, :city_town, :street_number
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'は半角の数字とハイフン(-)で入力して下さい' }
    validates :prefecture_id, numericality: { other_than: 1, message: "を選択してください" }
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は10から11文字の半角数字で入力してください' }
  end

  def save
    shipping = Shipping.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, city_town: city_town, street_number: street_number,
                           building_name: building_name, phone_number: phone_number, prefecture_id: prefecture_id, shipping_id: shipping.id)
  end
end
