class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :shippings

  validates :name, presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'を全角入力してください' } do
    validates :family_name
    validates :first_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: 'を全角カタカナで入力してください' } do
    validates :family_name_kana
    validates :first_name_kana
  end
  validates :birthday, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates_format_of :password, { with: PASSWORD_REGEX, message: 'を英字と数字の両方を含む6文字以上で設定してください' }
end
