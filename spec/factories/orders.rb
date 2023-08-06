FactoryBot.define do
  factory :order do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city_town { '東京都' }
    street_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '12344440000' }
  end
end
