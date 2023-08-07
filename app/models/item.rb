class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :cost_bearer
  belongs_to :prefecture
  belongs_to :shipping_day
  has_one_attached :image
  has_one :shipping

  validates  :image, presence: {message:'を選択してください'}
  with_options  presence: true do
  validates :name, :content, :user, :price
  validates :category_id, :status_id, :cost_bearer_id, :prefecture_id, :shipping_day_id, numericality: { other_than: 1, message: "を選択してください" }
  end                                                                                       
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: '300円から9999999円までの範囲で入力してください' }
  validates :price, numericality: { only_integer: true, message: '半角数字で入力してください' }
end
