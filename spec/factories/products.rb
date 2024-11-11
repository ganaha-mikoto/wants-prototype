FactoryBot.define do
  factory :product do
    title              { Faker::Commerce.product_name }
    description       { Faker::Lorem.sentence }    
    condition_id      { Faker::Number.between(from: 2, to: 7) }
    shipping_charge_id{ Faker::Number.between(from: 2, to: 3) }
    shipping_area_id  { Faker::Number.between(from: 2, to: 48) }
    shipping_day_id   { Faker::Number.between(from: 2, to: 4) }
    price         { Faker::Number.between(from: 0, to: 9_999_999) }
    association :user
    association :request
    after(:build) do |product|
      product.image.attach(io: File.open('spec/fixtures/files/sample_image.png'), filename: 'sample_image.png', content_type: 'image/png')
    end
  end
end
