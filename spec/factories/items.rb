FactoryBot.define do
  factory :item do
     association :user
     name             {'野菜生活'}
     content          {'野菜をジュースにしました'}
     category_id      {2}
     status_id        {2}
     cost_bearer_id   {2}
     prefecture_id    {2}
     shipping_day_id  {2}
     price            {400}

     after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
