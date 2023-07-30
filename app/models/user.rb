class User < ApplicationRecord
 devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

        validates :name,              presence: true
        with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角入力してください' } do
        validates :family_name,       presence: true
        validates :first_name,        presence: true
        end
        with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: '全角カタカナで入力してください' } do
        validates :family_name_kana , presence: true
        validates :first_name_kana ,  presence: true
        end
        validates :birthday,          presence: true
        PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
        validates_format_of :password, with: PASSWORD_REGEX
      end