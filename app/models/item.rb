class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :cost_bearer
  belongs_to :prefecture
  belongs_to :shipping_day
  has_one_attached :image

  validates :name, :content, :user, :image, :price, presence: true
  validates :category_id, :status_id, :prefecture_id, :cost_bearer_id, :shipping_day_id, presence: true,
                                                                                         numericality: { other_than: 1, message: "can't be blank" }
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'out of setting range' }
  validates :price, numericality: { only_integer: true, message: 'Half-width number.' }
end
