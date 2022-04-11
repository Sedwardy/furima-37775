FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials(number:2)}
    email {Faker::Internet.free_email}
    password {'1a'+Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name {'鈴木'}
    first_name {'陽一'}
    hurigana_last_name {'スズキ'}
    hurigana_first_name {'ヨウイチ'}
    date_of_birth {'1999-03-25'}
  end
end