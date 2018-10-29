FactoryBot.define do
  factory :user do
    name { Faker::Simpsons.character }
    username { Faker::Name.middle_name }
    email { Faker::Internet.email }
  end
