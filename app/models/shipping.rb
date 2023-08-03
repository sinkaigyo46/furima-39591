class Shipping < ApplicationRecord
  belongs_to :user
  belongs_to :item
end
