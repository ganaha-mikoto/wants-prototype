FactoryBot.define do
  factory :request do
    title              { Faker::Commerce.product_name }
    description       { Faker::Lorem.sentence }
    category_id       { Faker::Number.between(from: 2, to: 11) }
    shipping_charge_id{ Faker::Number.between(from: 2, to: 3) }
    max_price         { Faker::Number.between(from: 0, to: 9_999_999) }
    min_price         { Faker::Number.between(from: 0, to: 9_999_999) }
    association :user

    after(:build) do |request|
      request.image.attach(io: File.open('spec/fixtures/files/sample_image.png'), filename: 'sample_image.png', content_type: 'image/png')
    end
  end
end
