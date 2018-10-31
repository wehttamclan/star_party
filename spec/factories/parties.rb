FactoryBot.define do
  factory :party do
    title { "Sample Title" }
    date { "01-01-2019" }
    description { "Viewing the Sample Celestial Event" }
    street_address { "1000 Sample Road" }
    city { "Sampleville" }
    state { "CO"}
    zip_code { 80203 }
    latitude { 39.742043 }
    longitude { -104.991531 }
    association :host, factory: :user
  end
end
