class User < ApplicationRecord
 devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

        validates :name,              presence: true
        validates :family_name,       presence: true
        validates :first_name,        presence: true
        validates :family_name_kana , presence: true
        validates :first_name_kana ,  presence: true
        validates :birthday,          presence: true
end
