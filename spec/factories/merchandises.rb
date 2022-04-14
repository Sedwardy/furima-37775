FactoryBot.define do
  factory :merchandise do
    
    goods_name          {"hoge"}
    explain             {Faker::Lorem.sentence}
    condition_id        {2}
    delivery_fee_id     {2}
    prefecture_id       {2}
    date_of_shipping_id {2}
    price               {"9999"}
    category_id         {2}
    
    association :user
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/sample1.png'), filename: 'sample1.png')
    end
    
    

  end
end
