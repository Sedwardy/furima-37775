FactoryBot.define do
  factory :merchandise do
    id                  {1}
    user_id             {1}
    goods_name          {"hoge"}
    explain             {Faker::Lorem.sentence}
    condition_id        {2}
    delivery_fee_id     {2}
    prefecture_id       {2}
    date_of_shipping_id {2}
    price               {"9999"}
    category_id         {2}
    created_at          {'2022-04-13'}
    updated_at          {'2022-04-13'}
    
    association :user
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/sample1.png'), filename: 'sample1.png')
    end
    
    

  end
end
