class Shipping < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :shipping_address

end
