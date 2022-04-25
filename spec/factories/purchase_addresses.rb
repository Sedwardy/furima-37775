FactoryBot.define do
  factory :purchase_address do
    post_code          {"424-2424"}
    prefecture_id      {2}
    city                {"愛知県"}
    street_number       {"蒲郡市"}
    phone_number        {"88042424242"}
    token {"tok_abcdefghijk00000000000000000"}
    building_name       {"test"}
  end
end