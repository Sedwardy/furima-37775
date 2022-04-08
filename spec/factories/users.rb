FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials(number:2)}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    id {'1'}
    last_name {'鈴木'}
    first_name {'陽一'}
    hurigana_last_name {'スズキ'}
    hurigana_first_name {'ヨウイチ'}
    date_of_birth {'1999-03-25'}
    created_at {'2022-04-07,09:10:08.098565'}
    updated_at {'2022-04-07,09:10:08.098565'}
  end
end