FactoryBot.define do
  factory :purchase_address do
    post_code          {"hoge"}
    prefecture_id      {Faker::Lorem.sentence}
    city                {"test"}
    street_number       {"test"}
    phone_number        {2}
    token {"tok_abcdefghijk00000000000000000"}

  end
end