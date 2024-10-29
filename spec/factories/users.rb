FactoryBot.define do
  factory :user do
    nickname              { Faker::Internet.username }
    email                 { Faker::Internet.email }
    password              { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    first_name            { '田中'}
    last_name             { 'あらた' }
    first_name_kana       { 'タナカ' }  # 日本語の名前を仮定
    last_name_kana        { 'アラタ' }   # 日本語の名前を仮定
    birthday              { Faker::Date.birthday }
  end
end
