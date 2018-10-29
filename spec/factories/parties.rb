FactoryBot.define do
  factory :party do
    title { "Sample Title" }
    date { "01-01-2019" }
    description { "Viewing the Turing Nebula" }
    street_address { "5000 Miles Road" }
    city { "Starville" }
    state { "CO"}
    zip_code { 80203 }
    association :host, factory: :user
  end
end
